<template>
  <el-dialog
    :title="!dataForm.agentId ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible"
    width="80%"
  >
    <el-form ref="dataForm" :model="dataForm" :rules="dataRule" label-width="100px" style="width:95%;" @keyup.enter.native="dataFormSubmit()">
      <el-row>
        <el-col :span="24">
          <el-form-item label="单位编码" prop="agentNo">
            <el-input v-model="dataForm.agentNo" placeholder="请输入单位编码" />
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="单位名称" prop="agentName" :class="{ 'is-required': true }">
            <el-input v-model="dataForm.agentName" placeholder="请输入单位名称" />
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="联系人" prop="contact">
            <el-input v-model="dataForm.contact" placeholder="请输入联系人" />
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="联系方式" prop="mobile">
            <el-input v-model="dataForm.mobile" placeholder="请输入联系方式(手机号)" />
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="地址" prop="address">
            <el-input v-model="dataForm.address" placeholder="请输入单位地址" />
          </el-form-item>
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
              <img v-if="dataForm.agentIcon" :src="dataForm.agentIcon" style="height:100px">
              <i v-else class="el-icon-plus avatar-uploader-icon" />
            </el-upload>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="关于我们" prop="aboutUs">
            <el-input v-model="dataForm.aboutUs" type="textarea" rows="2" placeholder="请输入关于我们" />
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="备注" prop="remark">
            <el-input v-model="dataForm.remark" type="textarea" rows="2" placeholder="请输入备注" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="状态" prop="state">
            <el-radio-group v-model="dataForm.state">
              <el-radio :label="1">正常</el-radio>
              <el-radio :label="0">禁用</el-radio>
            </el-radio-group>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button type="danger" @click="visible = false">取 消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确 定</el-button>
    </span>
  </el-dialog>
</template>
<script>
// import { isMobile } from '@/utils/validate'
import { getUserInfo, add, edit } from '@/api/sys/agent'
import { getToken } from '@/utils/auth'
export default {
  data() {
    // const validateMobile = (rule, value, callback) => {
    //   if (!isMobile(value)) {
    //     callback(new Error('手机号格式错误'))
    //   } else {
    //     callback()
    //   }
    // }
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
      dataRule: {
        agentNo: [
          { required: true, message: '单位编码不能为空', trigger: 'blur' },
          { min: 2, max: 10, message: '单位编码长度在 2 到 10 个字符', trigger: 'blur' }
        ],
        agentName: [
          { required: true, message: '单位名称不能为空', trigger: 'blur' }
        ],
        contact: [
          { required: true, message: '联系人不能为空', trigger: 'blur' }
        ],
        mobile: [
          { required: true, message: '手机号不能为空', trigger: 'blur' }
        ]
      }
    }
  },
  created() {

  },
  methods: {
    init(id) {
      this.dataForm.agentId = id
      this.visible = true
      this.resetForm('dataForm')
      console.log('agentId=' + this.dataForm.agentId)
      if (this.dataForm.agentId) {
        getUserInfo(id).then(res => {
          if (res && res.code === 200) {
            console.log(res.data)
            this.dataForm.agentId = res.data.agentId
            this.dataForm.agentNo = res.data.agentNo
            this.dataForm.agentName = res.data.agentName
            this.dataForm.contact = res.data.contact
            this.dataForm.mobile = res.data.mobile
            this.dataForm.address = res.data.address
            this.dataForm.state = res.data.state
            this.dataForm.agentIcon = res.data.agentIcon
            this.dataForm.aboutUs = res.data.aboutUs
            this.dataForm.remark = res.data.remark
          }
        })
      }
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
            'agentNo': this.dataForm.agentNo,
            'agentName': this.dataForm.agentName,
            'contact': this.dataForm.contact,
            'mobile': this.dataForm.mobile,
            'address': this.dataForm.address,
            'state': this.dataForm.state,
            'agentIcon': this.dataForm.agentIcon,
            'aboutUs': this.dataForm.aboutUs,
            'remark': this.dataForm.remark
          }
          if (!this.dataForm.agentId) {
            add(param).then(res => {
              this.returnResponse(res)
            })
          } else {
            edit(param).then(res => {
              this.returnResponse(res)
            })
          }
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
</style>
