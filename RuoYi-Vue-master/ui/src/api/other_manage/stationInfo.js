import request from '@/utils/request'

// 查询站点详细信息列表
export function listStationInfo(query) {
  return request({
    url: '/other_manage/stationInfo/list',
    method: 'get',
    params: query
  })
}

// 查询站点详细信息详细
export function getStationInfo(infoId) {
  return request({
    url: '/other_manage/stationInfo/' + infoId,
    method: 'get'
  })
}

// 新增站点详细信息
export function addStationInfo(data) {
  return request({
    url: '/other_manage/stationInfo',
    method: 'post',
    data: data
  })
}

// 修改站点详细信息
export function updateStationInfo(data) {
  return request({
    url: '/other_manage/stationInfo',
    method: 'put',
    data: data
  })
}

// 删除站点详细信息
export function delStationInfo(infoId) {
  return request({
    url: '/other_manage/stationInfo/' + infoId,
    method: 'delete'
  })
}
