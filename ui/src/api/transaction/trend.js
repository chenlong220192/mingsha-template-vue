import request from '@/utils/request'

// 查询交易趋势列表
export function listTrend(query) {
  return request({
    url: '/transaction/trend/list',
    method: 'get',
    params: query
  })
}

// 查询交易趋势详细
export function getTrend(id) {
  return request({
    url: '/transaction/trend/' + id,
    method: 'get'
  })
}

// 新增交易趋势
export function addTrend(data) {
  return request({
    url: '/transaction/trend',
    method: 'post',
    data: data
  })
}

// 修改交易趋势
export function updateTrend(data) {
  return request({
    url: '/transaction/trend',
    method: 'put',
    data: data
  })
}

// 删除交易趋势
export function delTrend(id) {
  return request({
    url: '/transaction/trend/' + id,
    method: 'delete'
  })
}
