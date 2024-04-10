import request from '@/utils/request'

// 查询车辆信息列表
export function listCar(query) {
  return request({
    url: '/other_manage/car/list',
    method: 'get',
    params: query
  })
}

// 查询车辆信息详细
export function getCar(carId) {
  return request({
    url: '/other_manage/car/' + carId,
    method: 'get'
  })
}

// 新增车辆信息
export function addCar(data) {
  return request({
    url: '/other_manage/car',
    method: 'post',
    data: data
  })
}

// 修改车辆信息
export function updateCar(data) {
  return request({
    url: '/other_manage/car',
    method: 'put',
    data: data
  })
}

// 删除车辆信息
export function delCar(carId) {
  return request({
    url: '/other_manage/car/' + carId,
    method: 'delete'
  })
}
