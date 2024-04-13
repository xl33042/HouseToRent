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
			if (res.data.code === 200) {
				console.log("res===========")
				console.log(res)
				resolve(res)
			} else {
				console.log(res)
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