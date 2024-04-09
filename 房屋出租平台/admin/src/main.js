import Vue from 'vue'

import Cookies from 'js-cookie'

import 'normalize.css/normalize.css' // CSS重置的现代替代方案

import Element from 'element-ui'
import './styles/element-variables.scss'

import '@/styles/index.scss' // 全局 css

import App from './App'
import store from './store'
import router from './router'
import './icons' // icon
import './permission' // 权限控制
import './directive/permission/index'
import * as filters from './filters' // 全局过滤器

import { resetForm, returnResponse, download, handleTree } from '@/utils/lunhui'
import Echarts from 'vue-echarts'
import 'echarts/lib/chart/bar'
import 'echarts/lib/component/tooltip'
import 'echarts/lib/component/title'
import 'echarts/lib/component/legend'
import 'echarts/lib/component/dataset'
import BaiduMap from 'vue-baidu-map'
Vue.component('v-chart', Echarts)
// 全局方法挂载
Vue.prototype.resetForm = resetForm
Vue.prototype.returnResponse = returnResponse
Vue.prototype.download = download
Vue.prototype.handleTree = handleTree

Vue.prototype.msgSuccess = function(msg) {
  this.$message({ message: msg, type: 'success' })
}

Vue.prototype.msgError = function(msg) {
  this.$message({ message: msg, type: 'error' })
}

Vue.prototype.msgInfo = function(msg) {
  this.$message.info(msg)
}

Vue.prototype.confirm = function(text) {
  return this.$confirm(text, '温馨提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
    center: true
  })
}

Vue.use(Element, {
  size: 'mini' // 设置 element-ui 默认字体大小
})
Vue.use(BaiduMap, {
  // ak 是在百度地图开发者平台申请的密钥
  ak: '7eTaUxl9NY8RCMxCPm3oc8m2snTBOgbt'
})
// 注册全局filters
Object.keys(filters).forEach(key => {
  Vue.filter(key, filters[key])
})

Vue.config.productionTip = false
new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})
