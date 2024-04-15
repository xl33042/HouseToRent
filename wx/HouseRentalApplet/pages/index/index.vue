<template>
	<view style="background-color: #f4f4f5;">
		<view>
		  <!-- 轮播图 -->
		  <swiper 
		    indicator-dots="true" 
		    autoplay interval="3000" 
		    duration="500" 
		    circular="true" 
		    @change="changePic"
		  >
		    <swiper-item v-for="(item, index) in bannerList" :key="index">
		      <image :src="item.url" width="100%" height="200rpx" @click="toDetail(item.id)"></image>
		    </swiper-item>
		  </swiper>
		
		  <!-- 合并城市选择器和搜索框 -->
		  <view class="search-area">
		    <picker mode="selector" :range="cities" bindchange="onCityChange">
		      <view class="city-picker">
		        选择城市：{{ selectedCity }}
				  
		      </view>
		    </picker>
		
		    <input type="text" placeholder="请输入搜索内容" class="search-input">
		  </view>
			
		</view>
		<view class="u-demo-block__content">
		  <u-row justify="space-between" gutter="10" style="background-color: #fff;">
		    <u-col span="2" class="col-margin">
		      <view class="demo-layout bg-purple">
		        <image src="../../static/logo/新房.png" mode="aspectFit" style="width: 100%; height: 200rpx;"></image>
		        <text class="text-below">二手房</text>
		      </view>
		    </u-col>
			<u-col span="2" class="col-margin">
			  <view class="demo-layout bg-purple">
			    <image src="../../static/logo/新房.png" mode="aspectFit" style="width: 100%; height: 200rpx;"></image>
			    <text class="text-below">二手房</text>
			  </view>
			</u-col>
			<u-col span="2" class="col-margin">
			  <view class="demo-layout bg-purple">
			    <image src="../../static/logo/新房.png" mode="aspectFit" style="width: 100%; height: 200rpx;"></image>
			    <text class="text-below">二手房</text>
			  </view>
			</u-col>
			<u-col span="2" class="col-margin">
			  <view class="demo-layout bg-purple">
			    <image src="../../static/logo/新房.png" mode="aspectFit" style="width: 100%; height: 200rpx;"></image>
			    <text class="text-below">二手房</text>
			  </view>
			</u-col>
			<u-col span="2" class="col-margin">
			  <view class="demo-layout bg-purple">
			    <image src="../../static/logo/新房.png" mode="aspectFit" style="width: 100%; height: 200rpx;"></image>
			    <text class="text-below">二手房</text>
			  </view>
			</u-col>
		  </u-row>
		</view>
		<view style="background-color: #fff; width: 90%; height: 200px; margin: auto;"></view>
	</view>
  
</template>

<script>
  export default {
    data() {
      return {
        bannerList: [
          { id: 1, url: "../../static/banner/banner1.jpg" },
          { id: 2, url: "../../static/banner/banner2.png" },
          { id: 3, url: "../../static/banner/banner3.jpg" },
          { id: 4, url: "../../static/banner/banner4.jpg" },
          { id: 5, url: "../../static/banner/banner5.jpg" }					
        ],
        cities: ['北京', '上海', '广州', '深圳', '杭州'], // 城市列表
        selectedCity: '' // 选中的城市
      }
    },
    methods: {
      changePic(e){
        
        // navigateTo({
        // 	url:'url/id=1',
        // 	}
        // )
      },
      toDetail(id){
        console.log("id=" + id)
      },
      onCityChange(e) {
        this.selectedCity = this.cities[e.detail.value];
      },
	  
    }
  }
</script>

<style scoped lang="scss">
  .search-area {
    position: relative;
    margin: auto;
    width: 90%;
    margin-top: 20rpx;
  }

  .city-picker {
    position: absolute;
    left: 0;
    top: 0;
    width: 50%;
    height: 100rpx;
    line-height: 100rpx;
    border: 1rpx solid #ccc;
    border-radius: 25rpx;
    text-align: center;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 添加阴影 */
  }

  .search-input {
    position: absolute;
    right: 0;
    top: 0;
    width: 50%;
    height: 100rpx;
    padding: 0 20rpx;
    border: none;
    outline: none;
    border-radius: 25rpx;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 添加阴影 */
  }
  .icon {
      width: 100px; /* 调整图标宽度 */
      height: 100px; /* 调整图标高度 */
	  background-color: black;
	  }
	  .u-demo-block__content{
		  margin-top: 50px;
	  }
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
	    // margin-top: 50px; /* 调整文字与图片的上间距 */
	  }
</style>
