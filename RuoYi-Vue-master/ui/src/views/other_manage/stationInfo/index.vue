<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="关联主表的外键" prop="stationName">
        <el-input
          v-model="queryParams.stationName"
          placeholder="请输入关联主表的外键"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="站点经度" prop="lon">
        <el-input
          v-model="queryParams.lon"
          placeholder="请输入站点经度"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="站点纬度" prop="lat">
        <el-input
          v-model="queryParams.lat"
          placeholder="请输入站点纬度"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="站点方向角度" prop="azi">
        <el-input
          v-model="queryParams.azi"
          placeholder="请输入站点方向角度"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="关联线路外键" prop="belongRouteName">
        <el-input
          v-model="queryParams.belongRouteName"
          placeholder="请输入关联线路外键"
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
          v-hasPermi="['other_manage:stationInfo:add']"
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
          v-hasPermi="['other_manage:stationInfo:edit']"
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
          v-hasPermi="['other_manage:stationInfo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['other_manage:stationInfo:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="stationInfoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="infoId" />
      <el-table-column label="关联主表的外键" align="center" prop="stationName" />
      <el-table-column label="站点经度" align="center" prop="lon" />
      <el-table-column label="站点纬度" align="center" prop="lat" />
      <el-table-column label="站点方向角度" align="center" prop="azi" />
      <el-table-column label="关联线路外键" align="center" prop="belongRouteName" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['other_manage:stationInfo:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['other_manage:stationInfo:remove']"
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

    <!-- 添加或修改站点详细信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="关联主表的外键" prop="stationName">
          <el-input v-model="form.stationName" placeholder="请输入关联主表的外键" />
        </el-form-item>
        <el-form-item label="站点经度" prop="lon">
          <el-input v-model="form.lon" placeholder="请输入站点经度" />
        </el-form-item>
        <el-form-item label="站点纬度" prop="lat">
          <el-input v-model="form.lat" placeholder="请输入站点纬度" />
        </el-form-item>
        <el-form-item label="站点方向角度" prop="azi">
          <el-input v-model="form.azi" placeholder="请输入站点方向角度" />
        </el-form-item>
        <el-form-item label="关联线路外键" prop="belongRouteName">
          <el-input v-model="form.belongRouteName" placeholder="请输入关联线路外键" />
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
import { listStationInfo, getStationInfo, delStationInfo, addStationInfo, updateStationInfo } from "@/api/other_manage/stationInfo";

export default {
  name: "StationInfo",
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
      // 站点详细信息表格数据
      stationInfoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        stationName: null,
        lon: null,
        lat: null,
        azi: null,
        belongRouteName: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        stationName: [
          { required: true, message: "关联主表的外键不能为空", trigger: "blur" }
        ],
        lon: [
          { required: true, message: "站点经度不能为空", trigger: "blur" }
        ],
        lat: [
          { required: true, message: "站点纬度不能为空", trigger: "blur" }
        ],
        azi: [
          { required: true, message: "站点方向角度不能为空", trigger: "blur" }
        ],
        belongRouteName: [
          { required: true, message: "关联线路外键不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询站点详细信息列表 */
    getList() {
      this.loading = true;
      listStationInfo(this.queryParams).then(response => {
        this.stationInfoList = response.rows;
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
        infoId: null,
        stationName: null,
        lon: null,
        lat: null,
        azi: null,
        belongRouteName: null
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
      this.ids = selection.map(item => item.infoId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加站点详细信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const infoId = row.infoId || this.ids
      getStationInfo(infoId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改站点详细信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.infoId != null) {
            updateStationInfo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addStationInfo(this.form).then(response => {
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
      const infoIds = row.infoId || this.ids;
      this.$modal.confirm('是否确认删除站点详细信息编号为"' + infoIds + '"的数据项？').then(function() {
        return delStationInfo(infoIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('other_manage/stationInfo/export', {
        ...this.queryParams
      }, `stationInfo_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
