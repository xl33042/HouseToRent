<template>
  <div class="app-container">
    <el-form :inline="true" :model="listQuery" @keyup.enter.native="initData()">
      <el-form-item label="单位名称">
        <el-select v-model="listQuery.agentId" filterable placeholder="请选择" clearable>
          <el-option
            v-for="agent in agentList"
            :key="agent.agentId"
            :label="agent.agentName"
            :value="agent.agentId"
            @change="selectAgent()"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" @click="initData">搜索</el-button>
      </el-form-item>
      <el-row>
        <el-col :span="24">
          <el-form-item>
            <el-button v-has="'sys:agent:add'" type="primary" icon="el-icon-plus" @click="addOrUpdateHandle(1)">添加</el-button>
          </el-form-item>
          <el-form-item>
            <el-button v-has="'sys:agent:info'" type="primary" icon="el-icon-edit" :disabled="ids.length <= 0" @click="addOrUpdateHandle()">编辑</el-button>
          </el-form-item>
          <!-- <el-form-item>
            <el-button v-has="'sys:agent:del'" type="primary" icon="el-icon-delete" :disabled="ids.length <= 0" @click="deleteHandle()">删除</el-button>
          </el-form-item> -->
          <!-- <el-form-item>
            <el-button v-has="'sys:pay:add'" type="primary" icon="el-icon-plus" :disabled="ids.length <= 0" @click="pay">充值</el-button>
          </el-form-item> -->
          <el-form-item>
            <el-button v-has="'sys:pay:add'" type="primary" icon="el-icon-plus" :disabled="ids.length <= 0" @click="pay">添加摄像头</el-button>
          </el-form-item>
          <el-form-item>
            <el-button v-has="'sys:agent:info'" type="primary" icon="el-icon-download" plain @click="handleExcel">导出</el-button>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <el-table ref="topictable" v-loading="loading" :row-style="rowStyle" :height="tableHeight" size="mini" border :data="tableData" @selection-change="selectionChangeHandle">
      <el-table-column type="selection" width="50" align="center" />
      <el-table-column prop="agentId" label="ID" width="80" sortable align="center" />
      <el-table-column prop="agentNo" label="单位编号" show-overflow-tooltip align="center" />
      <el-table-column prop="agentName" label="单位名称" show-overflow-tooltip align="center" width="200" />
      <el-table-column prop="contact" label="联系人" show-overflow-tooltip align="center" />
      <el-table-column prop="mobile" label="联系方式" show-overflow-tooltip align="center" width="110" />
      <el-table-column prop="state" label="状态" width="80" align="center">
        <template slot-scope="scope">
          <p v-if="scope.row.state === 1">正常</p>
          <p v-else-if="scope.row.state === 0">禁用</p>
        </template>
      </el-table-column>
      <el-table-column prop="registerTime" label="注册时间" show-overflow-tooltip align="center" width="90" :formatter="formatDate" />
      <el-table-column prop="agentIcon" label="图标" width="120" align="center">
        <template slot-scope="scope">
          <img v-if="scope.row.agentIcon" :src="scope.row.agentIcon" class="sidebar-logo" height="30">
        </template>
      </el-table-column>
    </el-table>
    <pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.limit" @pagination="initData" />
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="initData" />

  </div>
</template>

<script>
import { getAgentList, del, exportExcel } from '@/api/sys/agent'
import Pagination from '@/components/Pagination'
import AddOrUpdate from './add-or-update'
import { getAllAgent } from '@/api/sys/user'

export default {
  name: 'Agent',
  components: {
    Pagination,
    AddOrUpdate
  },
  data() {
    return {
      listQuery: {
        page: 1,
        limit: 500,
        agentId: ''
      },
      total: 0,
      dateRange: null,
      loading: true,
      downloadLoading: false,
      ids: [],
      tableData: [],
      addOrUpdateVisible: false,
      payMoneyVisible: false,
      agentList: []
    }
  },
  created() {
    this.initData()
    this.getAllAgent()
  },
  mounted() {
    // console.log(window.innerHeight)
    // console.log(this.$refs.topictable.$el)
    // console.log(this.$refs.topictable.$el.offsetTop)
    this.tableHeight = window.innerHeight - this.$refs.topictable.$el.offsetTop - 80
    // console.log(this.tableHeight)
  },
  methods: {
    initData() {
      this.loading = true
      getAgentList(this.listQuery).then(res => {
        this.tableData = res.data.list
        this.total = res.data.totalCount
        this.loading = false
      })
    },
    // 多选
    selectionChangeHandle(val) {
      this.ids = val
    },
    // 添加和编辑
    addOrUpdateHandle(flag) {
      this.addOrUpdateVisible = true
      if (flag !== 1) {
        if (this.ids.length > 1) {
          this.$message.error('编辑操作只能选择单条数据')
          return
        }
        this.$nextTick(() => {
          this.$refs.addOrUpdate.init(this.ids[0].agentId)
        })
      } else {
        this.$nextTick(() => {
          this.$refs.addOrUpdate.init()
        })
      }
    },
    formatDate(row, column) {
      const daterc = row[column.property]
      console.log(daterc)
      if (daterc != null) {
        const dateMat = new Date(daterc)
        const year = dateMat.getFullYear()
        const month = dateMat.getMonth() + 1
        const day = dateMat.getDate()
        // const hh = dateMat.getHours()
        // const mm = dateMat.getMinutes()
        // const ss = dateMat.getSeconds()
        // const timeFormat = year + '/' + month + '/' + day + ' ' + hh + ':' + mm + ':' + ss
        const timeFormat = year + '-' + month + '-' + day
        return timeFormat
      }
    },
    // 导出
    handleExcel() {
      this.confirm(`是否确认导出所有数据项?`).then(res => {
        this.downloadLoading = true
        exportExcel(this.listQuery).then(res => {
          location.href = process.env.VUE_APP_BASE_API + '/villegePic/excel/' + res.data
        })
        this.downloadLoading = false
      }).catch(() => {})
    },
    // 删除
    deleteHandle(id) {
      const userIds = id ? [id] : this.ids.map(item => {
        return item.agentId
      })
      this.confirm(`确定对 [ id=${userIds.join(',')} ] 进行 [${id ? '删除' : '批量删除'}] 操作?`).then(res => {
        del(userIds).then(res => {
          this.loading = true
          if (res.code === 200) {
            this.loading = false
            this.initData()
            this.msgSuccess(res.msg)
          } else {
            this.msgError(res.msg)
          }
        })
      }).catch(() => {})
    },
    getAllAgent() {
      getAllAgent().then(res => {
        if (res.code === 200) {
          this.agentList = res.data
        } else {
          this.$message.error(res.msg)
        }
        console.log(res)
      }).catch(err => {
        console.log(err)
      })
    },
    rowStyle({ row, rowIndex }) {
      if (this.ids.includes(row)) {
        return { 'background-color': 'rgb(185, 211, 249)' }
      }
    }
  }
}
</script>
