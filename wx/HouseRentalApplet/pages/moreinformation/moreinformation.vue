<template>
	<view>
		<u-form labelPosition="left" :model="model1" :rules="rules" ref="uForm">
			<u-form-item label="性别" prop="userInfo.sex" borderBottom @click="showSex = true" ref="item1">
				<u-input v-model="model1.userInfo.sex" disabled disabledColor="#ffffff" placeholder="请选择性别"
					border="none"></u-input>
				<u-icon slot="right" name="arrow-right"></u-icon>
			</u-form-item>
		</u-form>
		<u-action-sheet :show="showSex" :actions="actions" title="请选择性别" @close="showSex = false"
			@select="sexSelect"></u-action-sheet>
		<u-form-item label="简介" prop="intro" borderBottom ref="item3">
			<u--textarea placeholder="不低于3个字" v-model="model1.intro" count></u--textarea>
		</u-form-item>
		<button style='background-color: #0055ff; color: #ffffff; width: 90%; margin: auto; margin-top: 10px;' @click="submit()"><b>退出登录</b></button>
		
	</view>
</template>


<script>
	export default {
		data() {
			return {
				showSex: false,
				showRegion: false,
				model1: {
					userInfo: {
						sex: '',
						region: '',
					},
				},

				actions: [{
						name: '男',
					},
					{
						name: '女',
					}
				],
				rules: {
					'userInfo.sex': {
						type: 'string',
						max: 1,
						required: true,
						message: '请选择男或女',
						trigger: ['blur', 'change']
					}
				},
				// intro: {
				// 	type: 'string',
				// 	min: 3,
				// 	required: true,
				// 	message: '不低于3个字',
				// 	trigger: ['change']
				// },
			};
		},
		methods: {
			sexSelect(e) {
				this.model1.userInfo.sex = e.name
				this.$refs.uForm.validateField('userInfo.sex')
			},
			regionSelect(e) {
				this.model1.userInfo.region = e.name
				this.$refs.uForm.validateField('userInfo.region')
			},
		},
		onReady() {
			this.$refs.uForm.setRules(this.rules)
		},
		
	};
</script>