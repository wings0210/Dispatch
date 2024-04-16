<template>


<div>
<div class="common-layout">
<el-container>
  <el-header>
    <div style="text-align: center;">
      <el-tag type="danger" class="tag1" style="font-size: 30px;">ข้อมูลคําสั่งข้อยกเว้น(异常订单信息)</el-tag>
    </div>
  </el-header>
  <el-main>

    <div class="navigation_1">
      <span>{{ $t('common.order_id') }}</span>
      <span>{{ $t('common.the_station_to_order') }}</span>
      <span>{{ $t('common.component_name') }}</span>
      <span>{{ $t('common.component_number') }}</span>
      <span>{{ $t('common.transport_vehicle') }}</span>
    </div>
    <div class="scroll-container_1" ref="scrollContainer_1">
      <transition-group name="fade" tag="div">
        <div v-for="(result_1, index_1) in warnResults" :key="index_1" class="result-item_1">
          <span>{{ result_1.orderId }}</span>
          <span>{{ result_1.stationName }}</span>
          <span>{{ result_1.componentName }}</span>
          <span>{{ result_1.number }}</span>
          <span>{{ result_1.carName }}</span>
        </div>
      </transition-group>
    </div>
  </el-main>
</el-container>
</div>

  <el-divider />

  <div class="common-layout_new">
    <el-container>
      <el-header>
        <div style="text-align: center;">
          <el-tag type="primary" class="tag2" style="font-size: 30px;">คําสั่งซื้อใหม่(待装货订单)</el-tag>
        </div>
      </el-header>
      <el-main>
        <div class="navigation_2">
          <span>{{ $t('common.order_id') }}</span>
          <span>{{ $t('common.the_station_to_order') }}</span>
          <span>{{ $t('common.component_name') }}</span>
          <span>{{ $t('common.component_number') }}</span>
          <span>{{ $t('common.transport_vehicle') }}</span>
        </div>
        <div class="scroll-container_2" ref="scrollContainer_2">
          <transition-group name="fade" tag="div">
            <div v-for="(result_2, index_2) in queryResults" :key="index_2" class="result-item_2">
              <span>{{ result_2.orderId }}</span>
              <span>{{ result_2.stationName }}</span>
              <span>{{ result_2.componentName }}</span>
              <span>{{ result_2.number }}</span>
              <span>{{ result_2.carName }}</span>
            </div>
          </transition-group>
        </div>
      </el-main>
    </el-container>
  </div>
</div>
</template>

<script>
import {listOrdersStorgeScreen, listOrdersWarn} from "@/api/screen/screen";
import LangSelect from "@/components/LangSelect/index.vue";

export default {
  name:'screen',
  components: { LangSelect },
  data() {
    return {
      warnResults:{},
      queryResults: {},
      scrollInterval_2: null,
      scrollInterval_1: null
    };
  },
  mounted() {
    this.scrollInterval_2 = setInterval(this.scrollResults_2, 5000); // 每隔5秒滚动一次
    this.scrollInterval_1 = setInterval(this.scrollResults_1, 5000); // 每隔5秒滚动一次
    setInterval(() => {
      this.fetchOrdersIndex(); // 每隔一段时间从数据库获取数据
    }, 5000); // 每5秒获取一次数据
    setInterval(() => {
      this.fetchOrdersWarn(); // 每隔一段时间从数据库获取数据
    }, 5000); // 每5秒获取一次数据
  },
  created() {
    this.fetchOrdersIndex();
    this.fetchOrdersWarn();
  },
  methods: {
    fetchOrdersIndex() {
      listOrdersStorgeScreen()
        .then(response => {
          //console.log(response);
          this.queryResults = response;
        })
    },
    fetchOrdersWarn() {
      listOrdersWarn()
        .then(response => {
          //console.log(response);
          this.warnResults = response;
        })
    },
    scrollResults_2() {
      const container_2 = this.$refs.scrollContainer_2;
      const firstItem_2 = container_2.querySelector('.result-item_2');
      if (firstItem_2) {
        firstItem_2.classList.add('fade-out');
        setTimeout(() => {
          container_2.appendChild(firstItem_2);
          firstItem_2.classList.remove('fade-out');
        }, 500); // 等待0.5秒后移除元素并取消渐出效果
      }
    },
    scrollResults_1() {
      const container_1 = this.$refs.scrollContainer_1;
      const firstItem_1 = container_1.querySelector('.result-item_1');
      if (firstItem_1) {
        firstItem_1.classList.add('fade-out');
        setTimeout(() => {
          container_1.appendChild(firstItem_1);
          firstItem_1.classList.remove('fade-out');
        }, 500); // 等待0.5秒后移除元素并取消渐出效果
      }
    },
    beforeDestroy() {
      clearInterval(this.scrollInterval_2); // 在组件销毁前清除定时器
      clearInterval(this.scrollInterval_1); // 在组件销毁前清除定时器
    }
  }
};
</script>

<style>
.navigation_1{
  line-height: 50px; /* 垂直居中文本 */
  text-align: center; /* 水平居中文本 */
  height: 50px;
  background-color: #f3eeee; /* 设置背景颜色 */
  display: flex; /* 使用flex布局 */
  justify-content: space-between; /* 子元素之间均匀分布 */
  padding: 10px; /* 设置内边距 */
  border-bottom: 1px solid #151414; /* 添加底部边框 */
}
.navigation_1 span{
  width: 50%; /* 设置每个子元素的宽度为50% */
  text-align: center; /* 设置文本居中对齐 */
}
.result-item_1 {
  line-height: 50px; /* 垂直居中文本 */
  text-align: center; /* 水平居中文本 */
  height: 50px;
  background-color: lightcoral; /* 设置背景颜色 */
  display: flex; /* 使用flex布局 */
  justify-content: space-between; /* 子元素之间均匀分布 */
  padding: 10px; /* 设置内边距 */
  border-bottom: 1px solid #453d1b; /* 添加底部边框 */
}

.result-item_1 span {
  width: 50%; /* 设置每个子元素的宽度为50% */
  text-align: center; /* 设置文本居中对齐 */
}
.scroll-container_1 {
  height: 200px;
  overflow: hidden;
}

.navigation_2{
  line-height: 50px; /* 垂直居中文本 */
  text-align: center; /* 水平居中文本 */
  height: 50px;
  background-color: #eef1f2; /* 设置背景颜色 */
  display: flex; /* 使用flex布局 */
  justify-content: space-between; /* 子元素之间均匀分布 */
  padding: 10px; /* 设置内边距 */
  border-bottom: 1px solid #453d1b; /* 添加底部边框 */
}
.navigation_2 span{
  width: 50%; /* 设置每个子元素的宽度为50% */
  text-align: center; /* 设置文本居中对齐 */
}
.result-item_2 {
  line-height: 50px; /* 垂直居中文本 */
  text-align: center; /* 水平居中文本 */
  height: 50px;
  background-color: lightcyan; /* 设置背景颜色 */
  display: flex; /* 使用flex布局 */
  justify-content: space-between; /* 子元素之间均匀分布 */
  padding: 10px; /* 设置内边距 */
  border-bottom: 1px solid #453d1b; /* 添加底部边框 */
}
.result-item_2 span {
  width: 50%; /* 设置每个子元素的宽度为50% */
  text-align: center; /* 设置文本居中对齐 */
}
.scroll-container_2 {
  height: 400px;
  overflow: hidden;
}


.fade-out {
  transition: transform 0.5s, opacity 0.5s; /* 定义渐出效果 */
  transform: translateY(-50px); /* 向上移动一个项的高度 */
  opacity: 0; /* 设置透明度为0 */
}
</style>
