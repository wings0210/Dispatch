import request from '@/utils/request'

// 查询物料管理列表
export function listComponent(query) {
  return request({
    url: '/other_manage/component/list',
    method: 'get',
    params: query
  })
}

// 查询物料管理详细
export function getComponent(componentId) {
  return request({
    url: '/other_manage/component/' + componentId,
    method: 'get'
  })
}

// 新增物料管理
export function addComponent(data) {
  return request({
    url: '/other_manage/component',
    method: 'post',
    data: data
  })
}

// 修改物料管理
export function updateComponent(data) {
  return request({
    url: '/other_manage/component',
    method: 'put',
    data: data
  })
}

// 删除物料管理
export function delComponent(componentId) {
  return request({
    url: '/other_manage/component/' + componentId,
    method: 'delete'
  })
}
