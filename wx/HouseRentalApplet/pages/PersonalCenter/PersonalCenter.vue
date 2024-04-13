<template>
  <view class="gradient-view">
    <view slot="title" class="profile" @tap="navigateToLoginPage">
      <view class="avatar">
        <u-avatar size="64" shape="circle"></u-avatar> <!-- 将头像设置为圆形 -->
      </view>
      <view class="nickname">
        点击注册/登录
      </view>
    </view>
  </view>
</template>

<style scoped>
.gradient-view {
  width: 100%;
  height: 100px;
  background: linear-gradient(to right, rgba(39, 78, 255, 1.0), rgba(65, 164, 250, 1.0)); /* 添加渐变 */
}

.profile {
  display: flex;
  align-items: center;
  line-height: 100px;
}

.avatar {
  margin-right: 10px; /* 间距 */
  margin-left: 20px; /* 左边距 */
}

.nickname {
  flex: 1; /* 占据剩余空间 */
  display: flex;
  align-items: center;
  color: #fff;
  size: 20px;
}
</style>

<script>
export default {
  methods: {
    navigateToLoginPage() {
      wx.navigateTo({
        url: '/pages/login/login' // 替换成你的登录页面路径
      });
    }
  }
}
</script>
