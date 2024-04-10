<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="车辆描述" prop="carDetail">
        <el-input
          v-model="queryParams.carDetail"
          placeholder="请输入车辆描述"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="车辆编号名称" prop="carName">
        <el-input
          v-model="queryParams.carName"
          placeholder="请输入车辆编号名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="车辆使用状态" prop="carStatus">
        <el-input
          v-model="queryParams.carStatus"
          placeholder="请输入车辆使用状态"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="车辆所属线路" prop="carRouteName">
        <el-input
          v-model="queryParams.carRouteName"
          placeholder="请输入车辆所属线路"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['other_manage:car:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['other_manage:car:edit']"
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
          v-hasPermi="['other_manage:car:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['other_manage:car:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="carList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="车辆id" align="center" prop="carId" />
      <el-table-column label="车辆类型" align="center" prop="carType" />
      <el-table-column label="车辆描述" align="center" prop="carDetail" />
      <el-table-column label="车辆编号名称" align="center" prop="carName" />
      <el-table-column label="车辆使用状态" align="center" prop="carStatus" />
      <el-table-column label="车辆所属线路" align="center" prop="carRouteName" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['other_manage:car:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['other_manage:car:remove']"
          >删除</el-button>
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

    <!-- 添加或修改车辆信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="车辆描述" prop="carDetail">
          <el-input v-model="form.carDetail" placeholder="请输入车辆描述" />
        </el-form-item>
        <el-form-item label="车辆编号名称" prop="carName">
          <el-input v-model="form.carName" placeholder="请输入车辆编号名称" />
        </el-form-item>
        <el-form-item label="车辆使用状态" prop="carStatus">
          <el-input v-model="form.carStatus" placeholder="请输入车辆使用状态" />
        </el-form-item>
        <el-form-item label="车辆所属线路" prop="carRouteName">
          <el-input v-model="form.carRouteName" placeholder="请输入车辆所属线路" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listCar, getCar, delCar, addCar, updateCar } from "@/api/other_manage/car";

export default {
  name: "Car",
  data() {
    return {
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
      // 车辆信息表格数据
      carList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        carType: null,
        carDetail: null,
        carName: null,
        carStatus: null,
        carRouteName: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        carStatus: [
          { required: true, message: "车辆使用状态不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询车辆信息列表 */
    getList() {
      this.loading = true;
      listCar(this.queryParams).then(response => {
        this.carList = response.rows;
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
        carId: null,
        carType: null,
        carDetail: null,
        carName: null,
        carStatus: null,
        carRouteName: null
      };
      this.resetForm("form");
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
      this.ids = selection.map(item => item.carId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加车辆信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const carId = row.carId || this.ids
      getCar(carId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改车辆信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.carId != null) {
            updateCar(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCar(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const carIds = row.carId || this.ids;
      this.$modal.confirm('是否确认删除车辆信息编号为"' + carIds + '"的数据项？').then(function() {
        return delCar(carIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('other_manage/car/export', {
        ...this.queryParams
      }, `car_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
