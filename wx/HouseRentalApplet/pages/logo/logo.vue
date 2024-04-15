<template>
  <view>
    <view class="u-demo-block__content">
      <u-row justify="space-between" gutter="10">
        <u-col span="2" class="col-margin">
          <view class="demo-layout bg-purple">
            <image src="../../static/logo/二手房.png" mode="aspectFit" style="width: 100%; height: 200rpx;"></image>
            <text class="text-below">二手房</text>
          </view>
        </u-col>
		<u-col span="2" class="col-margin">
		  <view class="demo-layout bg-purple">
		    <image src="../../static/logo/二手房.png" mode="aspectFit" style="width: 100%; height: 200rpx;"></image>
		    <text class="text-below">二手房</text>
		  </view>
		</u-col>
		<u-col span="2" class="col-margin">
		  <view class="demo-layout bg-purple">
		    <image src="../../static/logo/二手房.png" mode="aspectFit" style="width: 100%; height: 200rpx;"></image>
		    <text class="text-below">二手房</text>
		  </view>
		</u-col>
		<u-col span="2" class="col-margin">
		  <view class="demo-layout bg-purple">
		    <image src="../../static/logo/二手房.png" mode="aspectFit" style="width: 100%; height: 200rpx;"></image>
		    <text class="text-below">二手房</text>
		  </view>
		</u-col>
		<u-col span="2" class="col-margin">
		  <view class="demo-layout bg-purple">
		    <image src="../../static/logo/二手房.png" mode="aspectFit" style="width: 100%; height: 200rpx;"></image>
		    <text class="text-below">二手房</text>
		  </view>
		</u-col>
      </u-row>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {};
  },
  methods: {}
};
</script>

<style lang="scss">
.wrap {
  padding: 12px;
}

.col-margin {
  margin: 0 20px; /* 设置列的左右 margin */
}

.demo-layout {
  height: auto; /* 自适应高度 */
  border-radius: 4px;
  display: flex; /* 设置弹性布局 */
  flex-direction: column; /* 设置垂直方向的弹性布局 */
  align-items: center; /* 设置垂直居中 */
  justify-content: center; /* 设置居中 */
}

.text-below {
  font-size: 12px; /* 文本字体大小 */
  margin-top: 5px; /* 调整文字与图片的上间距 */
}

</style>
