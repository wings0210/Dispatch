<template>
  <el-dropdown trigger="click" class="international" @command="handleSetLanguage">
    <div>
      <svg-icon class-name="international-icon"  icon-class="language" :style="{ width: '40px', height: '40px' }" />
    </div>
    <el-dropdown-menu slot="dropdown">
      <el-dropdown-item :disabled="language==='zh'" command="zh">
        中文
      </el-dropdown-item>
      <el-dropdown-item :disabled="language==='en'" command="en">
        English
      </el-dropdown-item>
      <el-dropdown-item :disabled="language==='th'" command="th">
        ภาษาไทย
      </el-dropdown-item>
    </el-dropdown-menu>
  </el-dropdown>
</template>

<script>
export default {
  computed: {
    language() {
      return this.$store.getters.language
    }
  },
  methods: {
    handleSetLanguage(lang) {
      this.$i18n.locale = lang
      this.$store.dispatch('app/setLanguage', lang)
      this.$message({
        message: '设置语言成功 set language success',
        type: 'success'
      })
    }
  }
}
</script>
<style>
.international{
  height: 60px;
  width: 80px;
}
</style>
