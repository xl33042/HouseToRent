<template>
  <el-dialog
    :title="!dataForm.userId ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible"
    width="40%"
  >
    <el-form ref="dataForm" :model="dataForm" :rules="dataRule" label-width="100px" style="width:95%;" @keyup.enter.native="dataFormSubmit()">
      <el-row>
        <el-col :span="24">
          <el-form-item label="账号" prop="username">
            <el-input v-model="dataForm.username" :disabled="dataForm.userId>0" placeholder="请输入帐号" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="密码" prop="password" :class="{ 'is-required': !dataForm.userId }">
            <el-input v-model="dataForm.password" type="password" placeholder="请输入密码" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="确认密码" prop="confirmPassword" :class="{ 'is-required': !dataForm.userId }">
            <el-input v-model="dataForm.confirmPassword" type="password" placeholder="确认密码" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="真实姓名" prop="realName">
            <el-input v-model="dataForm.realName" placeholder="请输入真实姓名" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="联系人" prop="contact">
            <el-input v-model="dataForm.contact" placeholder="请输入联系人" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="手机号" prop="mobile">
            <el-input v-model="dataForm.mobile" placeholder="请输入手机号" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="单位名称" prop="agentId">
            <el-select v-model="dataForm.agentId" placeholder="请选择单位" filterable style="width: 100%">
              <el-option v-for="agent in agentList" :key="agent.agentId" :label="agent.agentName" :value="agent.agentId" />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="账户类别" prop="userType">
            <el-select v-if="this.$store.state.user.userType === 1" v-model="dataForm.userType" placeholder="请选择用户类别" style="width: 100%" @change="getRoleList">
              <el-option v-for="userType in userTypeList" :key="userType.key" :label="userType.value" :value="userType.key" />
            </el-select>
            <el-select v-if="this.$store.state.user.userType === 2" v-model="dataForm.userType" placeholder="请选择用户类别" style="width: 100%">
              <el-option v-for="userType in userTypeList2" :key="userType.key" :label="userType.value" :value="userType.key" />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="状态" prop="status">
            <el-radio-group v-model="dataForm.status">
              <el-radio :label="1">正常</el-radio>
              <el-radio :label="0">禁用</el-radio>
            </el-radio-group>
          </el-form-item>
        </el-col>
        <el-col :span="24">
          <el-form-item label="角色" prop="roleIdList">
            <el-select v-model="dataForm.roleIdList" multiple placeholder="请选择角色" style="width: 100%">
              <el-option v-for="role in roleList" :key="role.roleId" :label="role.roleName" :value="role.roleId" />
            </el-select>
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
import { getUserInfo, add, edit } from '@/api/sys/user'
import { getRoleList } from '@/api/sys/role'
import '@riophae/vue-treeselect/dist/vue-treeselect.css'
import { getAllAgent } from '@/api/sys/user'
export default {
  data() {
    const validatePassword = (rule, value, callback) => {
      if (!this.dataForm.userId && !/\S/.test(value)) {
        callback(new Error('密码不能为空'))
      } else {
        callback()
      }
    }
    const validateConfirmPassword = (rule, value, callback) => {
      if (!this.dataForm.userId && !/\S/.test(value)) {
        callback(new Error('确认密码不能为空'))
      } else if (this.dataForm.password !== value) {
        callback(new Error('确认密码与密码输入不一致'))
      } else {
        callback()
      }
    }
    // const validateMobile = (rule, value, callback) => {
    //   if (!isMobile(value)) {
    //     callback(new Error('手机号格式错误'))
    //   } else {
    //     callback()
    //   }
    // }
    return {
      visible: false,
      roleList: [],
      deptOptions: [],
      dataForm: {
        userId: '',
        username: '',
        password: '',
        realName: '',
        deptId: undefined,
        confirmPassword: '',
        email: '',
        mobile: '',
        roleIdList: [],
        status: 1,
        contact: '',
        agentId: '',
        userType: ''
      },
      agentList: [],
      userTypeList: [
        { key: 1, value: '系统管理员' },
        { key: 2, value: '单位管理员' }
      ],
      userTypeList2: [
        { key: 2, value: '单位管理员' }
      ],
      dataRule: {
        username: [
          { required: true, message: '用户名不能为空', trigger: 'blur' },
          { min: 3, max: 20, message: '账号长度在 3 到 20 个字符', trigger: 'blur' }
        ],
        password: [
          { validator: validatePassword, trigger: 'blur' }
        ],
        confirmPassword: [
          { validator: validateConfirmPassword, trigger: 'blur' }
        ],
        realName: [
          { required: true, message: '真实姓名不能为空', trigger: 'blur' }
        ],
        // mobile: [
        //   { required: true, message: '手机号不能为空', trigger: 'blur' },
        //   { validator: validateMobile, trigger: 'blur' }
        // ],
        roleIdList: [
          { required: true, message: '请选择用户角色', trigger: 'change' }
        ],
        userType: [
          { required: true, message: '请选择用户类型', trigger: 'change' }
        ],
        agent: [
          { required: true, message: '请选择单位', trigger: 'change' }
        ]
      }
    }
  },
  created() {
    this.getRoleList(1)
    this.getAgentList()
  },
  methods: {
    init(id) {
      this.dataForm.userId = id
      this.visible = true
      this.resetForm('dataForm')
      if (this.dataForm.userId) {
        getUserInfo(id).then(res => {
          if (res && res.code === 200) {
            this.dataForm.userId = res.data.userId
            this.dataForm.username = res.data.username
            this.dataForm.deptId = res.data.deptId
            this.dataForm.email = res.data.email
            this.dataForm.realName = res.data.realName
            this.dataForm.mobile = res.data.mobile
            this.dataForm.roleIdList = res.data.roleIdList
            this.dataForm.status = res.data.status
            this.dataForm.agentId = res.data.agentId
            this.dataForm.userType = res.data.userType
            // this.getRoleList(res.data.userType)
          }
        })
      }
    },
    // 获取角色列表
    getRoleList(userType) {
      getRoleList(userType).then(res => {
        this.roleList = res.data && res.code === 200 ? res.data : []
        this.dataForm.roleIdList = []
      })
    },
    /** 转换部门数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children
      }
      return {
        id: node.id,
        label: node.deptName,
        children: node.children
      }
    },
    // 表单提交
    dataFormSubmit() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          const param = {
            'userId': this.dataForm.userId,
            'username': this.dataForm.username,
            'password': this.dataForm.password,
            'realName': this.dataForm.realName,
            'deptId': this.dataForm.deptId,
            'email': this.dataForm.email,
            'mobile': this.dataForm.mobile,
            'status': this.dataForm.status,
            'roleIdList': this.dataForm.roleIdList,
            'userType': this.dataForm.userType,
            'agentId': this.dataForm.agentId,
            'contact': this.dataForm.contact
          }
          if (this.dataForm.agentId === '' || this.dataForm.agentId === 0) {
            alert('请选择合作单位')
            return
          }
          if (!this.dataForm.userId) {
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
    },
    getAgentList() {
      getAllAgent().then(res => {
        if (res.code === 200) {
          this.agentList = res.data
          if (this.$store.state.user.userType === 2) {
            console.log('agentid=' + this.agentList[0].agentId)
            this.dataForm.agentId = this.agentList[0].agentId
          }
        } else {
          this.$message.error(res.msg)
        }
      }).catch(err => {
        console.log(err)
      })
    }
  }
}
</script>
