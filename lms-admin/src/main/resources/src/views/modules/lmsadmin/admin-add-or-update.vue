<template>
  <el-dialog
    :title="!dataForm.adminId ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="管理员名" prop="adminName">
      <el-input v-model="dataForm.adminName" placeholder="管理员名"></el-input>
    </el-form-item>
    <el-form-item label="电话" prop="phoneNumber">
      <el-input v-model="dataForm.phoneNumber" placeholder="电话"></el-input>
    </el-form-item>
    <el-form-item label="头像图片" prop="avatarPic">
      <el-input v-model="dataForm.avatarPic" placeholder="头像图片"></el-input>
    </el-form-item>
    <el-form-item label="" prop="password">
      <el-input v-model="dataForm.password" placeholder=""></el-input>
    </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: false,
        dataForm: {
          adminName: '',
          adminId: 0,
          phoneNumber: '',
          avatarPic: '',
          password: ''
        },
        dataRule: {
          adminName: [
            { required: true, message: '管理员名不能为空', trigger: 'blur' }
          ],
          phoneNumber: [
            { required: true, message: '电话不能为空', trigger: 'blur' }
          ],
          avatarPic: [
            { required: true, message: '头像图片不能为空', trigger: 'blur' }
          ],
          password: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.adminId = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.adminId) {
            this.$http({
              url: this.$http.adornUrl(`/lmsadmin/admin/info/${this.dataForm.adminId}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.adminName = data.admin.adminName
                this.dataForm.phoneNumber = data.admin.phoneNumber
                this.dataForm.avatarPic = data.admin.avatarPic
                this.dataForm.password = data.admin.password
              }
            })
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/lmsadmin/admin/${!this.dataForm.adminId ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'adminName': this.dataForm.adminName,
                'adminId': this.dataForm.adminId || undefined,
                'phoneNumber': this.dataForm.phoneNumber,
                'avatarPic': this.dataForm.avatarPic,
                'password': this.dataForm.password
              })
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      }
    }
  }
</script>
