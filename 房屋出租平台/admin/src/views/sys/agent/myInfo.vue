<template>
  <div class="app-container">
    <el-form ref="dataForm" :model="dataForm" label-width="100px" style="width:95%;">
      <el-row>
        <el-col :span="24" style="padding-bottom:20px">
          <h3 class="titlebg">基本信息</h3>
        </el-col>
        <el-col :span="7">
          <el-form-item label="单位编码" prop="agentNo">
            <p>{{ agent.agentNo }}</p>
          </el-form-item>
        </el-col>
        <el-col :span="7">
          <el-form-item label="单位名称">
            <p>{{ agent.agentName }}</p>
          </el-form-item>
        </el-col>
        <el-col :span="10">
          <el-form-item label="地址">
            <p>{{ agent.address }}</p>
          </el-form-item>
        </el-col>
        <el-col :span="7">
          <el-form-item label="联系人">
            <el-input v-model="dataForm.contact" type="text" />
          </el-form-item>
        </el-col>
        <el-col :span="7">
          <el-form-item label="联系方式">
            <el-input v-model="dataForm.mobile" type="text" />
          </el-form-item>
        </el-col>
        <el-col :span="10" />
        <el-col :span="24" style="padding-bottom:20px">
          <h3 class="titlebg">单位设置</h3>
        </el-col>
        <el-col :span="24">
          <el-form-item label="系统标志" prop="agentIcon">
            <el-upload
              class="avatar-uploader"
              :headers="headers"
              :action="uploadUrl"
              :show-file-list="false"
              :on-success="handleAvatarSuccess"
              name="logo"
              :before-upload="beforeAvatarUpload"
            >
              <img v-if="dataForm.agentIcon" :src="dataForm.agentIcon" style="width:750px;height:127px">
              <span v-else>
                <i class="el-icon-plus avatar-uploader-icon" />
                <font color="red"><b>注：LOGO尺寸宽高为750*127像素最佳</b></font>
              </span>
            </el-upload>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="关于我们" prop="aboutUs">
            <el-input v-model="dataForm.aboutUs" type="textarea" rows="6" placeholder="请输入关于我们" />
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <span slot="footer" class="dialog-footer" style="padding-left:380px">
      <el-button type="primary" @click="dataFormSubmit()" style="width:120px;height:40px">修改</el-button>
    </span>
  </div>
</template>
<script>
import { myInfo, editMyInfo } from '@/api/sys/agent'
import { getToken } from '@/utils/auth'
export default {
  data() {
    return {
      uploadUrl: process.env.VUE_APP_BASE_API + '/sys/agent/logoUpload',
      headers: {
        token: getToken()
      },
      visible: false,
      dataForm: {
        agentId: '',
        agentNo: '',
        agentName: '',
        contact: '',
        mobile: '',
        address: '',
        agentIcon: '',
        aboutUs: '',
        remark: '',
        state: 1,
        imageUrl: ''
      },
      agent: []
    }
  },
  created() {
    this.init()
  },
  methods: {
    init() {
      myInfo().then(res => {
        if (res && res.code === 200) {
          this.agent = res.data
          console.log(this.agent)
          this.dataForm.agentId = res.data.agentId
          this.dataForm.agentIcon = res.data.agentIcon
          this.dataForm.aboutUs = res.data.aboutUs
          this.dataForm.contact = res.data.contact
          this.dataForm.mobile = res.data.mobile
        }
      })
    },
    // logo上传
    beforeAvatarUpload(file) {
      const isImg = ['image/jpeg', 'image/png', 'image/jpg', 'image/gif'].indexOf(file.type)
      const imgSize = file.size / 1024 / 1024 < 10
      if (isImg === -1) {
        this.$message.error('文件格式只能为jpg或png')
        return false
      }
      if (!imgSize) {
        this.$message.error('文件大小不能超过10M')
        return false
      }
      return isImg && imgSize
    },
    // logo上傳成功後的回调
    handleAvatarSuccess(data) {
      console.log('data=' + data.data)
      this.dataForm.agentIcon = data.data
      this.$message.success('上传成功')
      // this.dataForm.agentIcon = data.data
    },
    // 表单提交
    dataFormSubmit() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          const param = {
            'agentId': this.dataForm.agentId,
            'agentIcon': this.dataForm.agentIcon,
            'aboutUs': this.dataForm.aboutUs,
            'contact': this.dataForm.contact,
            'mobile': this.dataForm.mobile
          }
          editMyInfo(param).then(res => {
            this.$message.success('修改成功')
          })
        }
      })
    }
  }
}
</script>
<style>
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 80px;
    height: 40px;
    line-height: 40px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
  .el-form-item--mini .el-form-item__label {
    line-height: 28px;
    font-weight: 700;
  }
  .titlebg {
    background-color:#f0f0f0;
    height: 40px;
    padding-left: 28px;
    padding-top: 10px;
    font-weight: 700;
  }
</style>
