import request from '@/utils/request'

// 更新字典
export function UpdateDict(){
  return request({
    url: '/index/dict',
    method: 'put',
  })
}
