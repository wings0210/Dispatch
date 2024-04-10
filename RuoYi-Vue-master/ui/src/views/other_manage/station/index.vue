<template>
  <div>







  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="站点名称" prop="stationName">
        <el-input
          v-model="queryParams.stationName"
          placeholder="请输入站点名称"
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
          v-hasPermi="['other_manage:station:add']"
        >{{ $t('common.add') }}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['other_manage:station:edit']"
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
          v-hasPermi="['other_manage:station:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['other_manage:station:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="stationList" style="font-size: 16px;" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="站点id" align="center" prop="stationId"  />
      <el-table-column label="站点名称" align="center" prop="stationName"  />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" >
        <template slot-scope="scope">
          <el-row class="mb-4">
            <el-button
             size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['other_manage:station:edit']"
            round
          >修改</el-button>

          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['other_manage:station:remove']"
          >删除</el-button>
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

    <!-- 添加或修改站点管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="站点名称" prop="stationName">
          <el-input v-model="form.stationName" placeholder="请输入站点名称" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
<!--    <lang-select class="set-language" />-->
  </div>

  </div>
</template>

<script>
import {listStation, getStation, delStation, addStation, updateStation, get_spec} from "@/api/other_manage/station";
import axios from "axios";
import LangSelect from "@/components/LangSelect/index.vue";

export default {
  name: "Station",
  components: { LangSelect },
  data() {
    return {
      currentIndex: 0, // 当前显示数据的索引


      // 遮罩层
      //loading: true,
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
      // 站点管理表格数据
      stationList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        stationName: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        stationName: [
          { required: true, message: "站点名称不能为空", trigger: "blur" }
        ]
      }
    };
  },

  created() {
    this.getList();

  },
  methods: {


    /** 查询站点管理列表 */
    getList() {
      this.loading = true;
      listStation(this.queryParams).then(response => {
        this.stationList = response.rows;
        this.total = response.total;
        this.loading = false;
        console.log(this.stationList);
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
        stationId: null,
        stationName: null
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
      this.ids = selection.map(item => item.stationId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加站点管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const stationId = row.stationId || this.ids
      getStation(stationId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改站点管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.stationId != null) {
            updateStation(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addStation(this.form).then(response => {
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
      const stationIds = row.stationId || this.ids;
      this.$modal.confirm('是否确认删除站点管理编号为"' + stationIds + '"的数据项？').then(function() {
        return delStation(stationIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('other_manage/station/export', {
        ...this.queryParams
      }, `station_${new Date().getTime()}.xlsx`)
    }
  }

};
</script>
<style>

.navigation{
  line-height: 50px; /* 垂直居中文本 */
  text-align: center; /* 水平居中文本 */
  height: 50px;
  background-color: #efecec; /* 设置背景颜色 */
  display: flex; /* 使用flex布局 */
  justify-content: space-between; /* 子元素之间均匀分布 */
  padding: 10px; /* 设置内边距 */
  border-bottom: 1px solid #453d1b; /* 添加底部边框 */
}
.navigation span{
  width: 50%; /* 设置每个子元素的宽度为50% */
  text-align: center; /* 设置文本居中对齐 */
}
.result-item {
  line-height: 50px; /* 垂直居中文本 */
  text-align: center; /* 水平居中文本 */
  height: 50px;
  background-color: lightcoral; /* 设置背景颜色 */
  display: flex; /* 使用flex布局 */
  justify-content: space-between; /* 子元素之间均匀分布 */
  padding: 10px; /* 设置内边距 */
  border-bottom: 1px solid #453d1b; /* 添加底部边框 */
}

.result-item span {
  width: 50%; /* 设置每个子元素的宽度为50% */
  text-align: center; /* 设置文本居中对齐 */
}
.scroll-container {
  height: 200px;
  overflow: hidden;
}

.fade-out {
  transition: transform 0.5s, opacity 0.5s; /* 定义渐出效果 */
  transform: translateY(-50px); /* 向上移动一个项的高度 */
  opacity: 0; /* 设置透明度为0 */
}


</style>
