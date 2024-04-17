<template>
	<view style="background-color: #f4f4f5;">
		<view class="gradient-view">
			<view slot="title" class="profile" @tap="navigateToLoginPage">
				<view class="avatar">
					<u-avatar size="64" shape="circle"></u-avatar> <!-- 将头像设置为圆形 -->
				</view>
				<view class="nickname">
					{{userName}}

				</view>
			</view>
		</view>
		<!--------------- -->
		<view class="u-demo-block__content" style="background-color: #ffffff; height: 120px; line-height: 80px;">
			<u-row justify="space-between" gutter="10">
				<u-col span="3" class="col-margin">
					<view class="demo-layout bg-purple">
						<image src="../../static/icon_sztk02npdah/dingyue.png" mode="aspectFit"
							style="width: 100%; height: 100rpx;"></image>
						<text class="text-below">二手房</text>
					</view>
				</u-col>
				<u-col span="3" class="col-margin">
					<view class="demo-layout bg-purple">
						<image src="../../static/icon_sztk02npdah/guanzhu.png" mode="aspectFit"
							style="width: 100%; height: 100rpx;"></image>
						<text class="text-below">二手房</text>
					</view>
				</u-col>
				<u-col span="3" class="col-margin">
					<view class="demo-layout bg-purple">
						<image src="../../static/icon_sztk02npdah/liulan.png" mode="aspectFit"
							style="width: 100%; height: 100rpx;"></image>
						<text class="text-below">二手房</text>
					</view>
				</u-col>
				<u-col span="3" class="col-margin">
					<view class="demo-layout bg-purple">
						<image src="../../static/icons/profile_selected.png" mode="aspectFit"
							style="width: 100%; height: 100rpx;"></image>
						<text class="text-below">二手房</text>
					</view>
				</u-col>
			</u-row>
		</view>
		<view style="background-color: #ffffff; width: 100%; height: 150px; margin-top: 8px;">
			<view>
				<form style="font-size: 18px;left: 10px;">我家</form> | “3000万业主的房产管家”
			</view>

		</view>
		<view style="background-color: #ffffff; width: 100%; height: 100%; margin-top: 8px;">
			1111
		</view>
	</view>
</template>
<script>
	import request from '../../utils/request.js'
	export default {
		data() {
			return {
				fileList: [],
				userName: "点击注册/登录",
			}
		},
		created() {

			console.log("created.....")
			this.initializationUser()
		},
		methods: {
			navigateToLoginPage() {
				let token = uni.getStorageSync("token")
				if (token == "" || token == null) {
					wx.navigateTo({
						url: '/pages/login/login' // 替换成你的登录页面路径
					});
				} else {
					wx.navigateTo({
						url: '/pages/personalinformation/personalinformation'
					})
				}

			},

			//初始化用户信息
			initializationUser() {
				let token = uni.getStorageSync("token")

				if (token == "" || token == null) {
					uni.showToast({
						title: "请登录",
						icon: 'none' // 将图标设置为空，表示不显示图标
					})
				} else {
					request({
						url: 'tenantOperation/personalCenterData',
						method: "post",
						data: {
							token
						}

					}).then(res => {
						console.log("用户信息：" + res)

						this.userName = res.userName
						if (this.userName == "" || this.userName == null) {
							this.userName = res.mobile
						}



					})
				}
			}
		}

	}
</script>
<style scoped lang="scss">
	.gradient-view {
		width: 100%;
		height: 100px;
		background: linear-gradient(to right, rgba(39, 78, 255, 1.0), rgba(65, 164, 250, 1.0));
		/* 添加渐变 */
		line-height: 100px;
	}

	.profile {
		display: flex;


	}

	.avatar {
		width: 30%;
		height: 100%;
		margin-left: 30px;
		margin-top: 18px;

	}

	.nickname {

		// flex: 1;
		/* 占据剩余空间 */
		// display: flex;
		// align-items: center;
		color: #fff;
		font-size: 20px;
		width: 100%;
		height: 100%;
	}

	.icon {
		width: 100px;
		/* 调整图标宽度 */
		height: 100px;
		/* 调整图标高度 */
		background-color: black;
	}

	// .u-demo-block__content{
	//  margin-top: 30px;
	// }
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
		// line-height: 100px;
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