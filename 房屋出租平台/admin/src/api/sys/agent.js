import request from '@/utils/request'
export function getAgentList(data) {
  return request({
    url: '/sys/agent/list',
    method: 'POST',
    data
  })
}

export function getUserInfo(id) {
  return request({
    url: '/sys/agent/info/' + id,
    method: 'get'
  })
}

export function myInfo() {
  return request({
    url: '/sys/agent/myInfo',
    method: 'get'
  })
}
export function add(data) {
  return request({
    url: '/sys/agent/add',
    method: 'post',
    data
  })
}

export function edit(data) {
  return request({
    url: '/sys/agent/edit',
    method: 'put',
    data
  })
}

export function editMyInfo(data) {
  return request({
    url: '/sys/agent/editMyInfo',
    method: 'put',
    data
  })
}

export function del(data) {
  return request({
    url: '/sys/agent/del',
    method: 'delete',
    data
  })
}

export function exportExcel(data) {
  return request({
    url: '/sys/agent/exportExcel',
    method: 'post',
    data
  })
}
