<template>
	<view style="background-color: #f4f4f5;">
		<view>
			<!-- 轮播图 -->
			<swiper indicator-dots="true" autoplay interval="3000" duration="500" circular="true" @change="changePic">
				<swiper-item v-for="(item, index) in bannerList" :key="index">
					<image :src="item.url" width="100%" height="200rpx" @click="toDetail(item.id)"></image>
				</swiper-item>
			</swiper>

			<!-- 合并城市选择器和搜索框 -->
			<view class="search-area">
				<button @click.stop="show = true">城市选择器</button>
				<!-- 城市选择器 -->
				<u-picker :show="show" ref="uPicker" :columns="cityList" @confirm="confirm" @change="changeHandler"
					@cancel="show = false"></u-picker>
			</view>

		</view>
		<view class="u-demo-block__content">
			<u-row justify="space-between" gutter="10" style="background-color: #fff;">
				<u-col span="2" class="col-margin">
					<view class="demo-layout bg-purple">
						<image src="../../static/logo/新房.png" mode="aspectFit" style="width: 100%; height: 200rpx;">
						</image>
						<text class="text-below">二手房</text>
					</view>
				</u-col>
				<u-col span="2" class="col-margin">
					<view class="demo-layout bg-purple">
						<image src="../../static/logo/新房.png" mode="aspectFit" style="width: 100%; height: 200rpx;">
						</image>
						<text class="text-below">二手房</text>
					</view>
				</u-col>
				<u-col span="2" class="col-margin">
					<view class="demo-layout bg-purple">
						<image src="../../static/logo/新房.png" mode="aspectFit" style="width: 100%; height: 200rpx;">
						</image>
						<text class="text-below">二手房</text>
					</view>
				</u-col>
				<u-col span="2" class="col-margin">
					<view class="demo-layout bg-purple">
						<image src="../../static/logo/新房.png" mode="aspectFit" style="width: 100%; height: 200rpx;">
						</image>
						<text class="text-below">二手房</text>
					</view>
				</u-col>
				<u-col span="2" class="col-margin">
					<view class="demo-layout bg-purple">
						<image src="../../static/logo/新房.png" mode="aspectFit" style="width: 100%; height: 200rpx;">
						</image>
						<text class="text-below">二手房</text>
					</view>
				</u-col>
			</u-row>
		</view>
		<view style="background-color: #fff; width: 90%; height: 200px; margin: auto;"></view>
	</view>

</template>

<script>
	// 导入城市js文件
	import cityData from '@/utils/city.js'
	export default {
		data() {
			return {
				bannerList: [{
						id: 1,
						url: "../../static/banner/banner1.jpg"
					},
					{
						id: 2,
						url: "../../static/banner/banner2.png"
					},
					{
						id: 3,
						url: "../../static/banner/banner3.jpg"
					},
					{
						id: 4,
						url: "../../static/banner/banner4.jpg"
					},
					{
						id: 5,
						url: "../../static/banner/banner5.jpg"
					}
				],
				show: false,
				// 打开选择器显示默认城市
				cityList: [],
				cityLevel1: [],
				cityLevel2: [],
				cityLevel3: [],
				address:""

			}
		},

		onLoad() {
			// 城市选择器初始化
			this.initCityData();
		},
		methods: {
			changePic(e) {

				// navigateTo({
				// 	url:'url/id=1',
				// 	}
				// )
			},
			toDetail(id) {
				console.log("id=" + id)
			},
			onCityChange(e) {
				this.selectedCity = this.cities[e.detail.value];
			},



			initCityData() {
				// 遍历城市js
				cityData.forEach((item1, index1) => {
					let temp2 = [];
					this.cityLevel1.push(item1.provinceName);

					let temp4 = [];
					let temp3 = [];
					// 遍历市
					item1.cities.forEach((item2, index2) => {
						temp2.push(item2.cityName);
						// 遍历区
						item2.counties.forEach((item3, index3) => {
							temp3.push(item3.countyName);
						})
						temp4[index2] = temp3;
						temp3 = [];
					})
					this.cityLevel3[index1] = temp4;

					this.cityLevel2[index1] = temp2;
				})
				// 选择器默认城市
				this.cityList.push(this.cityLevel1, this.cityLevel2[0], this.cityLevel3[0][0]);
			},
			// 选中时执行
			changeHandler(e) {
				const {
					columnIndex,
					index,
					indexs,
					value,
					values,
					// 微信小程序无法将picker实例传出来，只能通过ref操作
					picker = this.$refs.uPicker
				} = e;
				if (columnIndex === 0) { // 选择第一列数据时
					// 设置第二列关联数据
					picker.setColumnValues(1, this.cityLevel2[index]);
					// 设置第三列关联数据
					picker.setColumnValues(2, this.cityLevel3[index][columnIndex]);
				} else if (columnIndex === 1) { // 选择第二列数据时
					// 设置第三列关联数据
					picker.setColumnValues(2, this.cityLevel3[indexs[0]][index]);
				}
			},
			// 单击确认按钮时执行
			confirm(e) {
				// 输出数组 [省, 市, 区]
				this.address = e.value[0]+"-"+e.value[1]+"-"+e.value[2]
				console.log(this.address);
				// 隐藏城市选择器
				this.show = false;
			}

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
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		/* 添加阴影 */
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
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		/* 添加阴影 */
	}

	.icon {
		width: 100px;
		/* 调整图标宽度 */
		height: 100px;
		/* 调整图标高度 */
		background-color: black;
	}

	.u-demo-block__content {
		margin-top: 50px;
	}

	.wrap {
		padding: 12px;
	}

	.col-margin {
		margin: 0 20px;
		/* 设置列的左右 margin */
	}

	.demo-layout {
		height: auto;
		/* 自适应高度 */
		border-radius: 4px;
		display: flex;
		/* 设置弹性布局 */
		flex-direction: column;
		/* 设置垂直方向的弹性布局 */
		align-items: center;
		/* 设置垂直居中 */
		justify-content: center;
		/* 设置居中 */
	}

	.text-below {
		font-size: 12px;
		/* 文本字体大小 */
		// margin-top: 50px; /* 调整文字与图片的上间距 */
	}
</style>