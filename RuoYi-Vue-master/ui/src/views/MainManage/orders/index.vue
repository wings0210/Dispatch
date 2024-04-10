<template>
<div>

  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="148px">
      <el-form-item :label="$t('common.component_name')" prop="componentId">
        <el-select v-model="queryParams.componentId" :placeholder="$t('searchingTip.please_select_component')" clearable>
          <el-option
            v-for="dict in componentlist"
            :key="dict.componentId"
            :label="dict.componentName"
            :value="dict.componentId"
          />
        </el-select>
      </el-form-item>

      <el-form-item :label="$t('common.transport_vehicle')" prop="carId">
        <el-select v-model="queryParams.carId" :placeholder="$t('searchingTip.please_select_car')" clearable>
          <el-option
            v-for="dict in carlist"
            :key="dict.carId"
            :label="dict.carName"
            :value="dict.carId"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">{{$t('common.search')}}</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">{{$t('common.reset')}}</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          style="font-size: 20px; padding: 15px 20px;"
          @click="handleAdd"
          v-hasPermi="['MainManage:orders:add']"
        >{{$t('common.add')}}</el-button>
      </el-col>
<!--      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['MainManage:orders:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['MainManage:orders:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['MainManage:orders:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>-->
    </el-row>

    <el-table v-loading="loading" :data="ordersList" @selection-change="handleSelectionChange">
<!--      <el-table-column type="selection" width="55" align="center" />-->
      <el-table-column :label="$t('common.order_id')" align="center" prop="orderId" />
      <el-table-column :label="$t('common.component_name')" align="center" prop="componentName">

      </el-table-column>
      <el-table-column :label="$t('common.the_station_to_order')" align="center" prop="stationName">

      </el-table-column>
      <el-table-column :label="$t('common.the_status_to_order')" align="center" prop="orderStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.order_status" :value="scope.row.orderStatus"/>
        </template>
      </el-table-column>
      <el-table-column :label="$t('common.create_time')" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{m}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column :label="$t('common.component_number')" align="center" prop="number" />
      <el-table-column :label="$t('common.transport_vehicle')" align="center" prop="carName">

      </el-table-column>
      <el-table-column :label="$t('common.operate')" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-row class="mb-4">
          <el-button
            style="font-size: 20px; padding: 15px 20px;"
            type="warning"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['MainManage:orders:edit']"
          >{{$t('common.modify')}}</el-button>
          </el-row>

        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加订单处理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item :label="$t('common.component_name')" prop="componentId">
          <el-select v-model="form.componentId" :placeholder="$t('listTip.please_select_component')">
            <el-option
              v-for="dict in componentlist"
              :key="dict.componentId"
              :label="dict.componentName"
              :value="dict.componentId"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item :label="$t('common.component_number')" prop="number">
          <el-input-number size="medium" v-model="form.number"  :min="1" :max="100" :placeholder="$t('listTip.please_select_number')"></el-input-number>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="add_button">{{$t('common.confirm')}}</el-button>
        <el-button @click="cancel">{{$t('common.cancel')}}</el-button>
      </div>
    </el-dialog>
    <!-- 修改对话框 -->
    <el-dialog :title="title_edit" :visible.sync="open_edit" width="500px" append-to-body>
      <el-form ref="form_edit" :model="form_edit" :rules="rules_edit" label-width="80px">
        <el-form-item :label="$t('common.the_status_to_order')" prop="orderStatus">
          <el-select v-model="form_edit.orderStatus" clearable :placeholder="$t('listTip.please_select_status_order')">
            <el-option
              v-for="dict in dict.type.line_edit"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>

        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">

        <el-button type="primary" @click="edit_button">{{$t('common.confirm')}}</el-button>
        <el-button @click="cancel_edit">{{$t('common.cancel')}}</el-button>

      </div>


    </el-dialog>
  </div>
</div>
</template>

<script>
import {
  getOrdersAssemblyLine,
  delOrdersAssemblyLine,
  addOrdersAssemblyLine,
  updateOrdersAssemblyLine,
  get_stationAssemblyLine,
  get_carAssemblyLine,
  get_componentAssemblyLine, get_spec_ordersAssemblyLine, listOrdersAssemblyLine, switch_username
} from "@/api/MainManage/orders";

import SidebarItem from "@/layout/components/Sidebar/SidebarItem.vue";
import LangSelect from "@/components/LangSelect/index.vue";

export default {
  name: "OrdersLine",
  components: {SidebarItem,LangSelect},
  dicts: ['order_status', 'component_select', 'station_select', 'car_select','line_add','line_edit','storage_edit'],
  data() {
    return {
      itemsOrders: [],
      scrollIntervalOrders: null,
      carlist: [],
      componentlist: [],
      stationlist: [],
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 订单处理表格数据
      ordersList: [],
      // 弹出层标题
      title: "",
      title_edit: "",
      // 是否显示弹出层
      open: false,
      open_edit: false,
      open_reconfirm: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        componentId: null,
        stationId: null,
        orderStatus: null,
        carId: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        componentId: [
          { required: true, message: "物料编号不能为空", trigger: "change" }
        ],
        stationId: [
          { required: true, message: "订单所属站点编号不能为空", trigger: "change" }
        ],
        orderStatus: [
          { required: true, message: "订单状态不能为空", trigger: "change" }
        ],
        createTime: [
          { required: true, message: "订单创建时间不能为空", trigger: "blur" }
        ],
        number: [
          { required: true, message: "物料数量不能为空", trigger: "blur" }
        ],
      },
      form_edit:{},
      rules_edit:{
        orderStatus: [
          { required: true, message: "订单状态不能为空", trigger: "change" }
        ]
      }
    };
  },
  mounted() {
    this.scrollIntervalOrders = setInterval(this.scrollResultsOrders, 5000); // 每隔5秒滚动一次
  },

  created() {
    this.getList();
    this.getStationList();
    this.getComponent();
    this.getCar();

    setInterval(() => {
      this.getList();
    }, 5000); // 每5秒获取一次数据
  },

  methods: {


    getStationList(){
      get_stationAssemblyLine().then(response=>{
        this.stationlist=response;
      });
    },
    getComponent(){
      get_componentAssemblyLine().then(response=>{
        this.componentlist=response;
      });
    },
    getCar(){
      get_carAssemblyLine().then(response=>{
        this.carlist=response;
      });
    },

    /** 查询订单处理列表 */
    getList() {
      this.loading = true;
      this.queryParams.stationId=switch_username();
      listOrdersAssemblyLine(this.queryParams).then(response => {
        this.ordersList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        orderId: null,
        componentId: null,
        stationId: null,
        orderStatus: null,
        createTime: null,
        number: null,
        carId: null
      };
      this.resetForm("form");
    },
    cancel_edit() {
      this.open_edit = false;
      this.reset_edit();
    },
    // 表单重置
    reset_edit() {
      this.form_edit = {
        orderId: null,
        componentId: null,
        stationId: null,
        orderStatus: null,
        createTime: null,
        number: null,
        carId: null
      };
      this.resetForm("form_edit");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.orderId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "create order";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset_edit();
      const orderId = row.orderId || this.ids
      getOrdersAssemblyLine(orderId).then(response => {
        this.form_edit = response.data;
        this.open_edit = true;
        this.title_edit = "edit order";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.form.orderStatus = 1;
      this.form.stationId = switch_username();
      this.$refs["form"].validate(valid => {
        if (valid) {
            addOrdersAssemblyLine(this.form).then(response => {
              this.$modal.msgSuccess("create successful");
              this.open = false;
              this.getList();
            });
          }

      });
    },
    /** 二级菜单提交按钮 */
    submitForm_edit() {

        this.$refs["form_edit"].validate(valid => {
          if (valid) {
            updateOrdersAssemblyLine(this.form_edit).then(response => {
              this.$modal.msgSuccess("edit successful");
              this.open_edit = false;
              this.getList();
            });
          }
        });

    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const orderIds = row.orderId || this.ids;
      this.$modal.confirm('是否确认删除订单处理编号为"' + orderIds + '"的数据项？').then(function() {
        return delOrdersAssemblyLine(orderIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('MainManage/orders/export', {
        ...this.queryParams
      }, `orders_${new Date().getTime()}.xlsx`)
    },

    add_button() {
      const h = this.$createElement;
      const component = this.componentlist.find(item =>item.componentId === this.form.componentId).componentName;
      const number = this.form.number;
      this.$msgbox({
        title: 'Warning',
        message: h('p', null, [
          h('span', { style: 'color: red' }, 'please reconfirm '),
          h('i', { style: 'color: teal' }, 'whether you are ready to create the order with part name '+ component + ' and part quantity ' + number)
        ]),
        showCancelButton: true,
        confirmButtonText: this.$t('common.confirm'),
        cancelButtonText: this.$t('common.cancel'),
        beforeClose: (action, instance, done) => {
          if (action === 'confirm') {
            instance.confirmButtonLoading = true;
            instance.confirmButtonText = 'executing...';
            setTimeout(() => {
              done();
              setTimeout(() => {
                instance.confirmButtonLoading = false;
              }, 300);
            }, 1000);

            this.submitForm();

          } else {
            done();
          }
        }
      }).then(action => {
        this.$message({
          type: 'info',
          message: 'action: ' + action
        });
      });
    },

    edit_button() {
      const h = this.$createElement;
      const orderId = this.form_edit.orderId;
      const component = this.componentlist.find(item =>item.componentId === this.form_edit.componentId).componentName;
      const number = this.form_edit.number;
      this.$msgbox({
        title: 'Warning',
        message: h('p', null, [
          h('span', null, 'please reconfirm '),
          h('i', { style: 'color: teal' }, 'whether you have fulfilled the order with orderId ' + orderId + ', part name ' + component + ' and part quantity ' + number)
        ]),
        showCancelButton: true,
        confirmButtonText: this.$t('common.confirm'),
        cancelButtonText: this.$t('common.cancel'),
        beforeClose: (action, instance, done) => {
          if (action === 'confirm') {
            instance.confirmButtonLoading = true;
            instance.confirmButtonText = 'executing...';
            setTimeout(() => {
              done();
              setTimeout(() => {
                instance.confirmButtonLoading = false;
              }, 300);
            }, 1000);

            this.submitForm_edit();

          } else {
            done();
          }
        }
      }).then(action => {
        this.$message({
          type: 'info',
          message: 'action: ' + action
        });
      });
    }
  }
};
</script>
<style>

.navigation-orders span{
  width: 50%; /* 设置每个子元素的宽度为50% */
  text-align: center; /* 设置文本居中对齐 */
}

.result-item-orders span {
  width: 50%; /* 设置每个子元素的宽度为50% */
  text-align: center; /* 设置文本居中对齐 */
}

</style>
