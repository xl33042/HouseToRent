import request from '@/utils/request'
export function getPersonList(data) {
  return request({
    url: '/sys/person/list',
    method: 'POST',
    data
  })
}

export function getInfo(id) {
  return request({
    url: '/sys/person/info/' + id,
    method: 'get'
  })
}

export function getCommunityList(id) {
  return request({
    url: '/sys/person/getCommunityList/' + id,
    method: 'get'
  })
}

export function add(data) {
  return request({
    url: '/sys/person/add',
    method: 'post',
    data
  })
}

export function edit(data) {
  return request({
    url: '/sys/person/edit',
    method: 'put',
    data
  })
}

export function addPerson(data) {
  return request({
    url: '/sys/person/addPerson',
    method: 'post',
    data
  })
}
export function del(data) {
  return request({
    url: '/sys/person/del',
    method: 'delete',
    data
  })
}

export function exportExcel(data) {
  return request({
    url: '/sys/person/exportExcel',
    method: 'post',
    data
  })
}

export function parsefile(filename) {
  return request({
    url: '/sys/person/parsefile/' + filename,
    method: 'get'
  })
}

