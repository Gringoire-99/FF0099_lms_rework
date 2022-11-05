<template>
  <el-dialog
    :title="!dataForm.userId ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="图书id" prop="bookId">
      <el-input v-model="dataForm.bookId" placeholder="图书id"></el-input>
    </el-form-item>
    <el-form-item label="借书时间" prop="borrowTime">
      <el-input v-model="dataForm.borrowTime" placeholder="借书时间"></el-input>
    </el-form-item>
    <el-form-item label="还书时间" prop="returnTime">
      <el-input v-model="dataForm.returnTime" placeholder="还书时间"></el-input>
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
          userId: 0,
          bookId: '',
          borrowTime: '',
          returnTime: ''
        },
        dataRule: {
          bookId: [
            { required: true, message: '图书id不能为空', trigger: 'blur' }
          ],
          borrowTime: [
            { required: true, message: '借书时间不能为空', trigger: 'blur' }
          ],
          returnTime: [
            { required: true, message: '还书时间不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/lmsmain/borrowrecord/info/${this.dataForm.userId}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.bookId = data.borrowRecord.bookId
                this.dataForm.borrowTime = data.borrowRecord.borrowTime
                this.dataForm.returnTime = data.borrowRecord.returnTime
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
              url: this.$http.adornUrl(`/lmsmain/borrowrecord/${!this.dataForm.userId ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'userId': this.dataForm.userId || undefined,
                'bookId': this.dataForm.bookId,
                'borrowTime': this.dataForm.borrowTime,
                'returnTime': this.dataForm.returnTime
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
