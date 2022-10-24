<template>
  <el-dialog
    :title="!dataForm.bookId ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="收藏人d" prop="userId">
      <el-input v-model="dataForm.userId" placeholder="收藏人d"></el-input>
    </el-form-item>
    <el-form-item label="收藏url" prop="url">
      <el-input v-model="dataForm.url" placeholder="收藏url"></el-input>
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
          bookId: 0,
          userId: '',
          url: ''
        },
        dataRule: {
          userId: [
            { required: true, message: '收藏人d不能为空', trigger: 'blur' }
          ],
          url: [
            { required: true, message: '收藏url不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.bookId = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.bookId) {
            this.$http({
              url: this.$http.adornUrl(`/lmsmain/favorites/info/${this.dataForm.bookId}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.userId = data.favorites.userId
                this.dataForm.url = data.favorites.url
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
              url: this.$http.adornUrl(`/lmsmain/favorites/${!this.dataForm.bookId ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'bookId': this.dataForm.bookId || undefined,
                'userId': this.dataForm.userId,
                'url': this.dataForm.url
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
