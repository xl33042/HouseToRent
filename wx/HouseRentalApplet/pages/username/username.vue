<template>
	<view class="u-page">
			<view class="u-demo-block">
		<!-- 注意，如果需要兼容微信小程序，最好通过setRules方法设置rules规则 -->
		<u--form
				labelPosition="left"
				:model="model1"
				:rules="rules"
				ref="uForm"
		>
			<u-form-item
					prop="userInfo.name"
					borderBottom
					ref="item1"
					style="margin-left: 10px;"
			>
				<u--input
						v-model="model1.userInfo.name"
						border="none"
				></u--input>
			</u-form-item>
		</u--form>
		<view class="hint">好的名字可以让你的房子更好出租</view>
		</view>
	</view>
</template>

<script>
export default {
	data() {
		return {
			showSex: false,
			model1: {
				userInfo: {
					name: 'uView UI',
				},
			},
			
			rules: {
				'userInfo.name': {
					type: 'string',
					required: true,
					message: '请填写姓名',
					trigger: ['blur', 'change']
				}
			},
			radio: '',
			switchVal: false
		};
	},
	methods: {
		
	},
	onReady() {
		//如果需要兼容微信小程序，并且校验规则中含有方法等，只能通过setRules方法设置规则。
    	this.$refs.uForm.setRules(this.rules)
    },
};
</script>
<style lang="scss">
	.hint{
		margin: 5px 10px;
		color: #d3d3d3;
	}
</style>
