<template>
  <view>
    <u-cell-group>
      <u-cell
        :titleStyle="{fontWeight: 500}"
        @click="openPersonalCenter"
        title="手机号"
		v-model="popupData.userName"
        isLink
      ></u-cell>
      <u-cell  
        :titleStyle="{fontWeight: 500}"
        @click="openPersonalCenter"
        title="身份认证"
        isLink
      ></u-cell>
      <u-cell
        :titleStyle="{fontWeight: 500}"
        @click="openPersonalCenter"
        title="个人信息"
        isLink
      ></u-cell>
    </u-cell-group>
    <u-popup
      :safeAreaInsetBottom="true"
      :safeAreaInsetTop="true"
      :mode="popupData.mode"
      :show="show"
      :round="popupData.round"
      :overlay="popupData.overlay"
      :borderRadius="popupData.borderRadius"
      :closeable="popupData.closeable"
      :closeOnClickOverlay="popupData.closeOnClickOverlay"
      @close="close"
      @open="open"
    >
      <view
        class="u-popup-slot"
        :style="{
          width: ['bottom', 'top'].includes(popupData.mode) ? '750rpx' : '200px',
          marginTop: ['left', 'right'].includes(popupData.mode) ? '480rpx' : '0',
        }"
      >
        <u-button
          type="success"
          text="点我关闭"
          customStyle="width: 200rpx"
          @click="show = !show"
        ></u-button>
      </view>
    </u-popup>
	<button style='background-color: #0055ff; color: #ffffff; width: 90%; margin: auto; margin-top: 10px;' @click="tuChuLogin()"><b>退出登录</b></button>
  </view>
</template>

<script>
export default {
  data() {
    return {
      show: false,
      popupData: {
        overlay: true,
        mode: 'bottom',
        borderRadius: '',
        closeable: true,
        closeOnClickOverlay: true,
		userName: "23214"
      },
    }
  },
  methods: {
    openPersonalCenter() {
      uni.navigateTo({
        url: '/pages/content/content'
      });
    },
    navigateBack() {
      uni.navigateBack()
    },
    open() {
      // console.log('open');
    },
    close() {
      this.show = false
      // console.log('close');
    },
	tuChuLogin(){
		uni.setStorageSync("token",null)
		uni.reLaunch({
			url:'/pages/PersonalCenter/PersonalCenter'
		})
	}
  }
}
</script>

<style lang="scss">
.u-popup-slot {
  width: 200px;
  height: 10px;
  @include flex;
  justify-content: center;
  align-items: center;
}
</style>
