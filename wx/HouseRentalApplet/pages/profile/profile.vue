<template>
	<view class="container">
		<view class="input-container">
			<input v-model="phoneNumber" type="number" placeholder="请输入手机号码" />
		</view>
		<view class="input-container">
			<input v-model="password" type="password" placeholder="请输入密码" />
		</view>
		<!--    <view class="checkbox-container">
      <checkbox v-model="agree" />
      <text>我已阅读并同意《服务条款》</text>
    </view> -->
		<button class="login-btn" @tap="login">登录/注册</button>
	</view>
</template>
<script>
	import request from '../../utils/request.js'
	export default {
		data() {
			return {
				phoneNumber: '',
				password: '',
				verificationCode: '',
				agree: false,
			};
		},
		computed: {
		},
		methods: {
			sendVerificationCode() {
				if (this.validPhoneNumber && !this.sendingCode) {
					this.sendingCode = true;
					setTimeout(() => {
						// 模拟发送验证码的操作
						console.log('发送验证码成功');
						this.sendingCode = false;
					}, 2000); // 这里设置了一个2秒的延迟来模拟发送验证码的过程
				}
			},
			login() {
				request({
					url: 'tenantOperation/loginOrRegisterValidation',
					method: "post",
					data: {
						"mobile": this.phoneNumber,
						"password": this.password
					}
				}).then(res => {
					if (res.code == 1) {
						uni.setStorageSync("token",res.msg)
						uni.reLaunch({
							url:'/pages/PersonalCenter/PersonalCenter'
						})
					} else {
						uni.showToast({
							title: res.msg,
							icon: 'none' // 将图标设置为空，表示不显示图标
						})
					}
				})
			}
		}
	};
</script>
<style scoped>
	.container {
		padding: 20px;
	}
	.input-container {
		display: flex;
		align-items: center;
		margin-bottom: 20px;
	}
	.checkbox-container {
		display: flex;
		align-items: center;
		margin-bottom: 20px;
	}
	input {
		flex: 1;
		height: 40px;
		padding: 0 10px;
		border: 1px solid #ccc;
		border-radius: 5px;
	}
	button {
		height: 40px;
		padding: 0 10px;
		border: none;
		border-radius: 5px;
		background-color: #007bff;
		color: #fff;
		cursor: pointer;
	}
	button:disabled {
		background-color: #ccc;
		color: #666;
	}
	.login-btn {
		width: 100%;
	}
</style>