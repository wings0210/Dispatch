import request from '@/utils/request'

// 查询站点管理列表
export function listOrdersStorgeScreen() {
  return request({
    url: '/screen/screen/storage',
    method: 'get',
  })
}
export function listOrdersWarn() {
  return request({
    url: '/screen/screen/warn',
    method: 'get',
  })
}
