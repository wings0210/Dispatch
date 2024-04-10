<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="物料零件名称" prop="componentName">
        <el-input
          v-model="queryParams.componentName"
          placeholder="请输入物料零件名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="物料零件类型" prop="componentType">
        <el-select v-model="queryParams.componentType" placeholder="请选择物料零件类型" clearable>
          <el-option
            v-for="dict in dict.type.component_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="物料零件图片" prop="view">
        <el-input
          v-model="queryParams.view"
          placeholder="请输入物料零件图片"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="零件重量" prop="weight">
        <el-input
          v-model="queryParams.weight"
          placeholder="请输入零件重量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="零件长度" prop="length">
        <el-input
          v-model="queryParams.length"
          placeholder="请输入零件长度"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="零件宽度" prop="wide">
        <el-input
          v-model="queryParams.wide"
          placeholder="请输入零件宽度"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="零件高度" prop="tall">
        <el-input
          v-model="queryParams.tall"
          placeholder="请输入零件高度"
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
          v-hasPermi="['other_manage:component:add']"
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
          v-hasPermi="['other_manage:component:edit']"
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
          v-hasPermi="['other_manage:component:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['other_manage:component:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="componentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="物料零件名称" align="center" prop="componentName" />
      <el-table-column label="物料零件编号" align="center" prop="componentId" />
      <el-table-column label="物料零件类型" align="center" prop="componentType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.component_type" :value="scope.row.componentType"/>
        </template>
      </el-table-column>
      <el-table-column label="物料零件图片" align="center" prop="view" />
      <el-table-column label="零件重量" align="center" prop="weight" />
      <el-table-column label="零件长度" align="center" prop="length" />
      <el-table-column label="零件宽度" align="center" prop="wide" />
      <el-table-column label="零件高度" align="center" prop="tall" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['other_manage:component:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['other_manage:component:remove']"
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

    <!-- 添加或修改物料管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="物料零件名称" prop="componentName">
          <el-input v-model="form.componentName" placeholder="请输入物料零件名称" />
        </el-form-item>
        <el-form-item label="物料零件类型" prop="componentType">
          <el-select v-model="form.componentType" placeholder="请选择物料零件类型">
            <el-option
              v-for="dict in dict.type.component_type"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="物料零件图片" prop="view">
          <el-input v-model="form.view" placeholder="请输入物料零件图片" />
        </el-form-item>
        <el-form-item label="零件重量" prop="weight">
          <el-input v-model="form.weight" placeholder="请输入零件重量" />
        </el-form-item>
        <el-form-item label="零件长度" prop="length">
          <el-input v-model="form.length" placeholder="请输入零件长度" />
        </el-form-item>
        <el-form-item label="零件宽度" prop="wide">
          <el-input v-model="form.wide" placeholder="请输入零件宽度" />
        </el-form-item>
        <el-form-item label="零件高度" prop="tall">
          <el-input v-model="form.tall" placeholder="请输入零件高度" />
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
import { listComponent, getComponent, delComponent, addComponent, updateComponent } from "@/api/other_manage/component";

export default {
  name: "Component",
  dicts: ['component_type'],
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
      // 物料管理表格数据
      componentList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        componentName: null,
        componentType: null,
        view: null,
        weight: null,
        length: null,
        wide: null,
        tall: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        componentName: [
          { required: true, message: "物料零件名称不能为空", trigger: "blur" }
        ],
        componentType: [
          { required: true, message: "物料零件类型不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询物料管理列表 */
    getList() {
      this.loading = true;
      listComponent(this.queryParams).then(response => {
        this.componentList = response.rows;
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
        componentName: null,
        componentId: null,
        componentType: null,
        view: null,
        weight: null,
        length: null,
        wide: null,
        tall: null
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
      this.ids = selection.map(item => item.componentId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加物料管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const componentId = row.componentId || this.ids
      getComponent(componentId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改物料管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.componentId != null) {
            updateComponent(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addComponent(this.form).then(response => {
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
      const componentIds = row.componentId || this.ids;
      this.$modal.confirm('是否确认删除物料管理编号为"' + componentIds + '"的数据项？').then(function() {
        return delComponent(componentIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('other_manage/component/export', {
        ...this.queryParams
      }, `component_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
