import request from '@/utils/request'

// 查询线路信息列表
export function listRouteInfo(query) {
  return request({
    url: '/other_manage/routeInfo/list',
    method: 'get',
    params: query
  })
}

// 查询线路信息详细
export function getRouteInfo(pointId) {
  return request({
    url: '/other_manage/routeInfo/' + pointId,
    method: 'get'
  })
}

// 新增线路信息
export function addRouteInfo(data) {
  return request({
    url: '/other_manage/routeInfo',
    method: 'post',
    data: data
  })
}

// 修改线路信息
export function updateRouteInfo(data) {
  return request({
    url: '/other_manage/routeInfo',
    method: 'put',
    data: data
  })
}

// 删除线路信息
export function delRouteInfo(pointId) {
  return request({
    url: '/other_manage/routeInfo/' + pointId,
    method: 'delete'
  })
}
