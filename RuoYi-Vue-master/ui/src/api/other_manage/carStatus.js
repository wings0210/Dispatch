import request from '@/utils/request'

// 查询车辆状态列表
export function listCarStatus(query) {
  return request({
    url: '/other_manage/carStatus/list',
    method: 'get',
    params: query
  })
}

// 查询车辆状态详细
export function getCarStatus(id) {
  return request({
    url: '/other_manage/carStatus/' + id,
    method: 'get'
  })
}

// 新增车辆状态
export function addCarStatus(data) {
  return request({
    url: '/other_manage/carStatus',
    method: 'post',
    data: data
  })
}

// 修改车辆状态
export function updateCarStatus(data) {
  return request({
    url: '/other_manage/carStatus',
    method: 'put',
    data: data
  })
}

// 删除车辆状态
export function delCarStatus(id) {
  return request({
    url: '/other_manage/carStatus/' + id,
    method: 'delete'
  })
}
