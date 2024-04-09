const baseUrl = process.env.VUE_APP_BASE_API

const api = {
  state: {
    // 实时控制台
    socketApi: baseUrl + '/websocket?token=kl',
    // 修改头像
    updateAvatarApi: baseUrl + '/sys/user/updateAvatar',
    // Sql 监控
    sqlApi: baseUrl + '/druid/sql.html',
    // swagger
    swaggerApi: baseUrl + '/swagger-ui.html',
    // 文件上传
    fileUploadApi: baseUrl + '/sys/oss/upload',
    // baseUrl
    baseApi: baseUrl
  }
}

export default api
