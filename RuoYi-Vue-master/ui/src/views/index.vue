<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :sm="24" :lg="24">
        <blockquote class="text-warning" style="font-size: 14px">
         大成wms系统
        </blockquote>
        <hr />
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2>大成后台管理框架</h2>
        <p>
          大成管理系统实验版本
        </p>
        <p>
          <b>当前版本:</b> <span>v{{ version }}</span>
        </p>


      </el-col>


    </el-row>
    <el-divider />

  </div>
</template>


<script>
import {UpdateDict} from "@/utils/dict/UpdateDict";
export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "0.0.1"
    };
  },
  created() {
     /*this.updateDict();*/
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    }
    /*updateDict(){
      UpdateDict.then(response => {
      //console.log(response);
      this.items = response.rows;
    })}*/

  }
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}
</style>

