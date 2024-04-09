<template>
  <div class="app-container">
    <el-form :inline="true" :model="listQuery" @keyup.enter.native="initData()">
      <el-form-item label="角色名称">
        <el-input v-model="listQuery.roleName" placeholder="输入角色名称查询" clearable />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" @click="initData">搜索</el-button>
      </el-form-item>
      <el-form-item>
        <el-button v-has="'sys:role:add'" type="primary" icon="el-icon-plus" @click="addOrUpdateHandle()">添加</el-button>
      </el-form-item>
      <el-form-item>
        <el-button v-has="'sys:role:del'" type="danger" icon="el-icon-delete" :disabled="dataListSelections.length <= 0" @click="deleteHandle()">删除</el-button>
      </el-form-item>
    </el-form>
    <el-table v-loading="loading" border :data="tableData" :row-style="rowStyle" @selection-change="selectionChangeHandle">
      <el-table-column type="selection" width="50" align="center" />
      <el-table-column prop="roleId" label="ID" width="80" align="center" />
      <el-table-column prop="roleName" label="角色名称" align="center" />
      <el-table-column prop="type" label="角色类型" align="center">
        <template slot-scope="scope">
          <p v-if="scope.row.type === 1">系统角色</p>
          <p v-else-if="scope.row.type === 2">单位角色</p>
        </template>
      </el-table-column>
      <el-table-column prop="remark" label="备注" align="center" />
      <el-table-column prop="createTime" label="创建时间" align="center" />
      <el-table-column align="center" label="操作">
        <template slot-scope="scope">
          <el-button v-has="'sys:role:edit'" size="small" type="text" @click="addOrUpdateHandle(scope.row.roleId)">编辑</el-button>
          <el-button v-has="'sys:role:del'" size="small" type="text" @click="deleteHandle(scope.row.roleId)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.limit" @pagination="initData" />
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="initData" />
  </div>
</template>

<script>
import { getDataList, del } from '@/api/sys/role'
import Pagination from '@/components/Pagination'
import AddOrUpdate from './add-or-update'

export default {
  name: 'Role',
  components: {
    Pagination,
    AddOrUpdate
  },
  data() {
    return {
      listQuery: {
        page: 1,
        limit: 500,
        roleName: ''
      },
      total: 0,
      loading: true,
      dataListSelections: [],
      tableData: [],
      addOrUpdateVisible: false
    }
  },
  created() {
    this.initData()
  },
  methods: {
    initData() {
      this.loading = true
      getDataList(this.listQuery).then(res => {
        this.tableData = res.data.list
        this.total = res.data.totalCount
        this.loading = false
      })
    },
    // 多选
    selectionChangeHandle(val) {
      this.dataListSelections = val
    },
    // 添加和编辑
    addOrUpdateHandle(id) {
      this.addOrUpdateVisible = true
      this.$nextTick(() => {
        this.$refs.addOrUpdate.init(id)
      })
    },
    // 删除
    deleteHandle(id) {
      const roleIds = id ? [id] : this.dataListSelections.map(item => {
        return item.roleId
      })
      this.confirm(`确定对 [ id=${roleIds.join(',')} ] 进行 [${id ? '删除' : '批量删除'}] 操作?`).then(res => {
        del(roleIds).then(res => {
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
    rowStyle({ row, rowIndex }) {
      if (this.dataListSelections.includes(row)) {
        return { 'background-color': 'rgb(185, 211, 249)' }
      }
    }
  }
}
</script>
