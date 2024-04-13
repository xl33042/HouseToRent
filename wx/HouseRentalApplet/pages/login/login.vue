<template>
  <view>
    <div style="display: flex; align-items: center; justify-content: center; margin-top: 170px;">
      <div style="display: flex; flex-direction: column; align-items: center; text-align: center;">
        <img src="/static/a4ffcfcba0b17c260061c8728a8da0b.png" style="width: 100px; height: 100px;">
        <div style="color: #414141; font-size: 20px; margin-top: 10px;">租赁巢</div>
        <div style="color: #414141; font-size: 16px; margin-top: 5px;">让家更美好</div>
      </div>
    </div>
    <view class="content">
      <button class="custom-button" @tap="navigateToLogin">手机验证码登录</button>
      <view class="checkbox-container">
        <u-checkbox-group><u-checkbox @change="tyTiaoKuan" :checked="agree"></u-checkbox>我已阅读并同意《服务条款》</u-checkbox-group>
      </view>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      title: 'Hello',
      agree: false // 添加 agree 数据，用于保存复选框的状态
    }
  },
  methods: {
    navigateToLogin() {
		console.log(this.agree)
      if (!this.agree) {
        uni.showToast({
          title: '请先同意服务条款',
          icon: 'none',
        });
      } else {
        // 修改为相对路径，确保与项目结构一致
        uni.navigateTo({
          url: '/pages/profile/profile'
        });
      }
    },
	tyTiaoKuan(){
		
		this.agree = !this.agree
	}
  }
}
</script>

<style lang="scss">
@import "uview-ui/index.scss";
.content {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.custom-button {
  width: 200px; /* 修改按钮宽度 */
  border: 1px solid #414141;
  background-color: transparent;
  color: #414141;
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
  outline: none;
  transition: background-color 0.3s, color 0.3s;
}

.custom-button:hover {
  color: #414141;
}

.checkbox-container {
  margin-top: 10px;
}
</style>