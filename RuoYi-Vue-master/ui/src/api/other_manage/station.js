import request from '@/utils/request'

// 查询站点管理列表
export function listStation(query) {
  return request({
    url: '/other_manage/station/list',
    method: 'get',
    params: query
  })
}

// 查询站点管理详细
export function getStation(stationId) {
  return request({
    url: '/other_manage/station/' + stationId,
    method: 'get'
  })
}


// 新增站点管理
export function addStation(data) {
  return request({
    url: '/other_manage/station',
    method: 'post',
    data: data
  })
}

// 修改站点管理
export function updateStation(data) {
  return request({
    url: '/other_manage/station',
    method: 'put',
    data: data
  })
}

// 删除站点管理
export function delStation(stationId) {
  return request({
    url: '/other_manage/station/' + stationId,
    method: 'delete'
  })
}

export function get_spec(){
  return request({
    url: '/other_manage/station/spec',
    method: 'get'
  })
}
