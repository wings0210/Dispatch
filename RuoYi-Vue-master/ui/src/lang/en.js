export default {
  login: {
    title: 'DC Login Form',
    logIn: 'Log in',
    username: 'Username',
    password: 'Password',
    remember: 'Remember me',
    code: 'Verification code',
    user_name_tag:'Username not empty',
    user_password_tag:'Password not empty',
    code_tag: 'Verification code not empty'
  },
  tagsView: {
    refresh: 'Refresh',
    close: 'Close',
    closeOthers: 'Close Others',
    closeAll: 'Close All'
  },
  settings: {
    title: 'Page style setting',
    theme: 'Theme Color',
    tagsView: 'Open Tags-View',
    fixedHeader: 'Fixed Header',
    sidebarLogo: 'Sidebar Logo'
  },
  common: {
    confirm: 'confirm',
    cancel:'cancel',
    add: 'add',
    modify: 'modify',
    delete: 'delete',
    download: 'download',
    search: 'search',
    reset: 'reset',
    modify_list: 'modify',
    delete_list: 'delete',
    order_id:'order id',
    the_station_to_order:'the station to order',
    the_status_to_order:'the status to order',
    create_time:'creation time',
    component_name:'material name',
    component_number:'number',
    transport_vehicle:'vehicle',
    operate:'operate',

  },
  searchingTip:{
    please_select_component:'please select material',
    please_select_station:'please select station',
    please_select_car:'please select car'
  },
  listTip:{
    please_select_component:'please select material',
    please_select_station:'please select station',
    please_select_status_order:'please select the status of order',
    please_select_number:'please select the number of material',
    please_select_car:'please select car'
  }

}
// 普通文本使用方式： {{ $t('login.title') }}
// 标签内使用方式：   :placeholder="$t('login.password')"
// js内使用方式       this.$t('login.user.password.not.match')
