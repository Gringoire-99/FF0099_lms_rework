<template>
  <el-dialog
    :title="!dataForm.userId ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="评论内容" prop="content">
      <el-input v-model="dataForm.content" placeholder="评论内容"></el-input>
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
    <el-form-item label="评分" prop="score">
      <el-input v-model="dataForm.score" placeholder="评分"></el-input>
    </el-form-item>
    <el-form-item label="" prop="commentTime">
      <el-input v-model="dataForm.commentTime" placeholder=""></el-input>
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
          likes: '',
          dislikes: '',
          bookId: '',
          score: '',
          commentTime: ''
        },
        dataRule: {
          content: [
            { required: true, message: '评论内容不能为空', trigger: 'blur' }
          ],
          likes: [
            { required: true, message: '点赞数不能为空', trigger: 'blur' }
          ],
          dislikes: [
            { required: true, message: '踩数不能为空', trigger: 'blur' }
          ],
          bookId: [
            { required: true, message: '书id不能为空', trigger: 'blur' }
          ],
          score: [
            { required: true, message: '评分不能为空', trigger: 'blur' }
          ],
          commentTime: [
            { required: true, message: '不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/lmsadmin/comment/info/${this.dataForm.userId}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.content = data.comment.content
                this.dataForm.likes = data.comment.likes
                this.dataForm.dislikes = data.comment.dislikes
                this.dataForm.bookId = data.comment.bookId
                this.dataForm.score = data.comment.score
                this.dataForm.commentTime = data.comment.commentTime
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
              url: this.$http.adornUrl(`/lmsadmin/comment/${!this.dataForm.userId ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'content': this.dataForm.content,
                'userId': this.dataForm.userId || undefined,
                'likes': this.dataForm.likes,
                'dislikes': this.dataForm.dislikes,
                'bookId': this.dataForm.bookId,
                'score': this.dataForm.score,
                'commentTime': this.dataForm.commentTime
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
