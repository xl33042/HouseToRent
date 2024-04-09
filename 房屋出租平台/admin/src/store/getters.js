const getters = {
  sidebar: state => state.app.sidebar,
  size: state => state.app.size,
  device: state => state.app.device,
  visitedViews: state => state.tagsView.visitedViews,
  cachedViews: state => state.tagsView.cachedViews,
  token: state => state.user.token,
  avatar: state => state.user.avatar,
  name: state => state.user.name,
  introduction: state => state.user.introduction,
  roles: state => state.user.roles,
  permission_routes: state => state.permission.routes,
  buttons: state => state.permission.buttons,
  fileUploadApi: state => state.api.fileUploadApi,
  sqlApi: state => state.api.sqlApi,
  agentIcon: state => state.user.agentIcon,
  userType: state => state.user.userType
}
export default getters
