import request from '@/utils/request'

// 查询线路列表
export function listRoute(query) {
  return request({
    url: '/other_manage/route/list',
    method: 'get',
    params: query
  })
}

// 查询线路详细
export function getRoute(routeId) {
  return request({
    url: '/other_manage/route/' + routeId,
    method: 'get'
  })
}

// 新增线路
export function addRoute(data) {
  return request({
    url: '/other_manage/route',
    method: 'post',
    data: data
  })
}

// 修改线路
export function updateRoute(data) {
  return request({
    url: '/other_manage/route',
    method: 'put',
    data: data
  })
}

// 删除线路
export function delRoute(routeId) {
  return request({
    url: '/other_manage/route/' + routeId,
    method: 'delete'
  })
}
