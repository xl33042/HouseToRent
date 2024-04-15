import {
	baseUrl
} from 'utils/index.js'
import {
	methods
} from 'uview-ui/libs/mixin/mixin'

function request(option) {

	return new Promise((resolve) => {
		uni.request({
			url: `${baseUrl}${option.url}`,
			data: option.data ? option.data : null,
			method: option.method ? option.method : 'get'
		}).then(res => {
				console.log("返回的数据：")
				
				if(res.data.code === 200){
					resolve(res.data.msg)
				}

				
			
		}).catch(err => {
			console.log(res)
			// uni.showToast({
			// 	title:'接口错误'
			// })
		})
	})
}

export default request