<template>
  <el-dialog
    :title="!dataForm.userId ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="评论内容" prop="content">
      <el-input v-model="dataForm.content" placeholder="评论内容"></el-input>
    </el-form-item>
    <el-form-item label="评论用户名" prop="userName">
      <el-input v-model="dataForm.userName" placeholder="评论用户名"></el-input>
    </el-form-item>
    <el-form-item label="头像图片" prop="avatarPic">
      <el-input v-model="dataForm.avatarPic" placeholder="头像图片"></el-input>
    </el-form-item>
    <el-form-item label="点赞数" prop="likes">
      <el-input v-model="dataForm.likes" placeholder="点赞数"></el-input>
    </el-form-item>
    <el-form-item label="踩数" prop="dislikes">
      <el-input v-model="dataForm.dislikes" placeholder="踩数"></el-input>
    </el-form-item>
    <el-form-item label="书id" prop="bookId">
      <el-input v-model="dataForm.bookId" placeholder="书id"></el-input>
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
          content: '',
          userId: 0,
          userName: '',
          avatarPic: '',
          likes: '',
          dislikes: '',
          bookId: ''
        },
        dataRule: {
          content: [
            { required: true, message: '评论内容不能为空', trigger: 'blur' }
          ],
          userName: [
            { required: true, message: '评论用户名不能为空', trigger: 'blur' }
          ],
          avatarPic: [
            { required: true, message: '头像图片不能为空', trigger: 'blur' }
          ],
          likes: [
            { required: true, message: '点赞数不能为空', trigger: 'blur' }
          ],
          dislikes: [
            { required: true, message: '踩数不能为空', trigger: 'blur' }
          ],
          bookId: [
            { required: true, message: '书id不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/lmsmain/comment/info/${this.dataForm.userId}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.content = data.comment.content
                this.dataForm.userName = data.comment.userName
                this.dataForm.avatarPic = data.comment.avatarPic
                this.dataForm.likes = data.comment.likes
                this.dataForm.dislikes = data.comment.dislikes
                this.dataForm.bookId = data.comment.bookId
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
              url: this.$http.adornUrl(`/lmsmain/comment/${!this.dataForm.userId ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'content': this.dataForm.content,
                'userId': this.dataForm.userId || undefined,
                'userName': this.dataForm.userName,
                'avatarPic': this.dataForm.avatarPic,
                'likes': this.dataForm.likes,
                'dislikes': this.dataForm.dislikes,
                'bookId': this.dataForm.bookId
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
