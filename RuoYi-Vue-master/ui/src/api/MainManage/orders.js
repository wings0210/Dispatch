import request from '@/utils/request'
import Cookies from "js-cookie";

// 查询订单处理列表
export function listOrdersAssemblyLine(query) {
  return request({
    url: '/MainManage/ordersAssemblyLine/AssemblyLine',
    method: 'get',
    params: query
  })
}
export function listOrdersStorage(query) {
  return request({
    url: '/MainManage/ordersStorage/Storage',
    method: 'get',
    params: query
  })
}

// 查询订单处理详细
export function getOrdersAssemblyLine(orderId) {
  return request({
    url: '/MainManage/ordersAssemblyLine/' + orderId,
    method: 'get'
  })
}
export function getOrdersStorage(orderId) {
  return request({
    url: '/MainManage/ordersStorage/' + orderId,
    method: 'get'
  })
}
// 新增订单处理
export function addOrdersAssemblyLine(data) {
  return request({
    url: '/MainManage/ordersAssemblyLine',
    method: 'post',
    data: data
  })
}
export function addOrdersStorage(data) {
  return request({
    url: '/MainManage/ordersStorage',
    method: 'post',
    data: data
  })
}

// 修改订单处理
export function updateOrdersAssemblyLine(data) {
  return request({
    url: '/MainManage/ordersAssemblyLine',
    method: 'put',
    data: data
  })
}
export function updateOrdersStorage(data) {
  return request({
    url: '/MainManage/ordersStorage',
    method: 'put',
    data: data
  })
}
// 删除订单处理
export function delOrdersAssemblyLine(orderId) {
  return request({
    url: '/MainManage/ordersAssemblyLine/' + orderId,
    method: 'delete'
  })
}
export function delOrdersStorage(orderId) {
  return request({
    url: '/MainManage/ordersStorage/' + orderId,
    method: 'delete'
  })
}
//动态加载下拉框
export function get_componentAssemblyLine(){
  return request({
    url: '/MainManage/ordersAssemblyLine/getComponent',
    method: 'get'
  })
}
export function get_componentStorage(){
  return request({
    url: '/MainManage/ordersStorage/getComponent',
    method: 'get'
  })
}
export function get_stationAssemblyLine(){
  return request({
    url: '/MainManage/ordersAssemblyLine/getStation',
    method: 'get'
  })
}
export function get_stationStorage(){
  return request({
    url: '/MainManage/ordersStorage/getStation',
    method: 'get'
  })
}
export function get_carAssemblyLine(){
  return request({
    url: '/MainManage/ordersAssemblyLine/getCar',
    method: 'get'
  })
}
export function get_carStorage(){
  return request({
    url: '/MainManage/ordersStorage/getCar',
    method: 'get'
  })
}

export function get_spec_ordersAssemblyLine(){
  return request({
    url: '/MainManage/ordersAssemblyLine/getSpecOrders',
    method: 'get'
  })
}
export function get_spec_ordersStorage(){
  return request({
    url: '/MainManage/ordersStorage/getSpecOrders',
    method: 'get'
  })
}

export function switch_username(){
  const username = Cookies.get("username");
  let id;
  switch (username) {
    case 'station_1':
      id=1;
      break;
    case 'station_2':
      id=2;
      break;
    case 'station_3':
      id=3;
      break;
    case 'station_4':
      id=4;
      break;
    case 'station_5':
      id=5;
      break;
    case 'station_6':
      id=6;
      break;
    case 'station_7':
      id=7;
      break;
    case 'station_8':
      id=8;
      break;
    case 'station_9':
      id=9;
      break;
    case 'station_10':
      id=10;
      break;
    case 'station_11':
      id=11;
      break;
    case 'station_12':
      id=12;
      break;
    default:
      id=0;
      break;

  }
  return id;
}
