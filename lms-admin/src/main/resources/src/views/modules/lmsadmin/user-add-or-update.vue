<template>
  <el-dialog
    :title="!dataForm.userId ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="用户名" prop="userName">
      <el-input v-model="dataForm.userName" placeholder="用户名"></el-input>
    </el-form-item>
    <el-form-item label="密码" prop="password">
      <el-input v-model="dataForm.password" placeholder="密码"></el-input>
    </el-form-item>
    <el-form-item label="用户性别" prop="gender">
      <el-input v-model="dataForm.gender" placeholder="用户性别"></el-input>
    </el-form-item>
    <el-form-item label="手机号" prop="phoneNumber">
      <el-input v-model="dataForm.phoneNumber" placeholder="手机号"></el-input>
    </el-form-item>
    <el-form-item label="借阅数" prop="borrowNumber">
      <el-input v-model="dataForm.borrowNumber" placeholder="借阅数"></el-input>
    </el-form-item>
    <el-form-item label="邮箱" prop="email">
      <el-input v-model="dataForm.email" placeholder="邮箱"></el-input>
    </el-form-item>
    <el-form-item label="头像" prop="avatarPic">
      <el-input v-model="dataForm.avatarPic" placeholder="头像"></el-input>
    </el-form-item>
    <el-form-item label="余额" prop="balance">
      <el-input v-model="dataForm.balance" placeholder="余额"></el-input>
    </el-form-item>
    <el-form-item label="备注" prop="remark">
      <el-input v-model="dataForm.remark" placeholder="备注"></el-input>
    </el-form-item>
    <el-form-item label="出生日期" prop="birthdate">
      <el-input v-model="dataForm.birthdate" placeholder="出生日期"></el-input>
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
          userName: '',
          userId: 0,
          password: '',
          gender: '',
          phoneNumber: '',
          borrowNumber: '',
          email: '',
          avatarPic: '',
          balance: '',
          remark: '',
          birthdate: ''
        },
        dataRule: {
          userName: [
            { required: true, message: '用户名不能为空', trigger: 'blur' }
          ],
          password: [
            { required: true, message: '密码不能为空', trigger: 'blur' }
          ],
          gender: [
            { required: true, message: '用户性别不能为空', trigger: 'blur' }
          ],
          phoneNumber: [
            { required: true, message: '手机号不能为空', trigger: 'blur' }
          ],
          borrowNumber: [
            { required: true, message: '借阅数不能为空', trigger: 'blur' }
          ],
          email: [
            { required: true, message: '邮箱不能为空', trigger: 'blur' }
          ],
          avatarPic: [
            { required: true, message: '头像不能为空', trigger: 'blur' }
          ],
          balance: [
            { required: true, message: '余额不能为空', trigger: 'blur' }
          ],
          remark: [
            { required: true, message: '备注不能为空', trigger: 'blur' }
          ],
          birthdate: [
            { required: true, message: '出生日期不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.userId = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.userId) {
            this.$http({
              url: this.$http.adornUrl(`/lmsadmin/user/info/${this.dataForm.userId}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.userName = data.user.userName
                this.dataForm.password = data.user.password
                this.dataForm.gender = data.user.gender
                this.dataForm.phoneNumber = data.user.phoneNumber
                this.dataForm.borrowNumber = data.user.borrowNumber
                this.dataForm.email = data.user.email
                this.dataForm.avatarPic = data.user.avatarPic
                this.dataForm.balance = data.user.balance
                this.dataForm.remark = data.user.remark
                this.dataForm.birthdate = data.user.birthdate
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
              url: this.$http.adornUrl(`/lmsadmin/user/${!this.dataForm.userId ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'userName': this.dataForm.userName,
                'userId': this.dataForm.userId || undefined,
                'password': this.dataForm.password,
                'gender': this.dataForm.gender,
                'phoneNumber': this.dataForm.phoneNumber,
                'borrowNumber': this.dataForm.borrowNumber,
                'email': this.dataForm.email,
                'avatarPic': this.dataForm.avatarPic,
                'balance': this.dataForm.balance,
                'remark': this.dataForm.remark,
                'birthdate': this.dataForm.birthdate
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
