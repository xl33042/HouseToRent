<template>
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
        <image :src="item.url" height="200rpx" @click="toDetail(item.id)"></image>
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
        console.log(this.bannerList[e.detail.current].id)
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
      }
    }
  }
</script>

<style scoped>
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
</style>
