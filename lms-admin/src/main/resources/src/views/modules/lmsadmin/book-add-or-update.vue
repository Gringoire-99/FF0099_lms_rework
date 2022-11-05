<template>
  <el-dialog
    :title="!dataForm.bookId ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="是否删除(0-未删, 1-已删)" prop="isDeleted">
      <el-input v-model="dataForm.isDeleted" placeholder="是否删除(0-未删, 1-已删)"></el-input>
    </el-form-item>
    <el-form-item label="作者" prop="author">
      <el-input v-model="dataForm.author" placeholder="作者"></el-input>
    </el-form-item>
    <el-form-item label="库存数量" prop="number">
      <el-input v-model="dataForm.number" placeholder="库存数量"></el-input>
    </el-form-item>
    <el-form-item label="正在阅读数" prop="readingNumber">
      <el-input v-model="dataForm.readingNumber" placeholder="正在阅读数"></el-input>
    </el-form-item>
    <el-form-item label="出版社" prop="press">
      <el-input v-model="dataForm.press" placeholder="出版社"></el-input>
    </el-form-item>
    <el-form-item label="书名" prop="bookName">
      <el-input v-model="dataForm.bookName" placeholder="书名"></el-input>
    </el-form-item>
    <el-form-item label="印刷时间" prop="pressTime">
      <el-input v-model="dataForm.pressTime" placeholder="印刷时间"></el-input>
    </el-form-item>
    <el-form-item label="收藏" prop="stars">
      <el-input v-model="dataForm.stars" placeholder="收藏"></el-input>
    </el-form-item>
    <el-form-item label="点赞数" prop="likes">
      <el-input v-model="dataForm.likes" placeholder="点赞数"></el-input>
    </el-form-item>
    <el-form-item label="价格" prop="price">
      <el-input v-model="dataForm.price" placeholder="价格"></el-input>
    </el-form-item>
    <el-form-item label="摘要" prop="summary">
      <el-input v-model="dataForm.summary" placeholder="摘要"></el-input>
    </el-form-item>
    <el-form-item label="图片的url地址" prop="coverPic">
      <el-input v-model="dataForm.coverPic" placeholder="图片的url地址"></el-input>
    </el-form-item>
    <el-form-item label="字数统计" prop="wordCount">
      <el-input v-model="dataForm.wordCount" placeholder="字数统计"></el-input>
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
          isDeleted: '',
          author: '',
          number: '',
          readingNumber: '',
          press: '',
          bookName: '',
          pressTime: '',
          stars: '',
          likes: '',
          price: '',
          summary: '',
          coverPic: '',
          wordCount: ''
        },
        dataRule: {
          isDeleted: [
            { required: true, message: '是否删除(0-未删, 1-已删)不能为空', trigger: 'blur' }
          ],
          author: [
            { required: true, message: '作者不能为空', trigger: 'blur' }
          ],
          number: [
            { required: true, message: '库存数量不能为空', trigger: 'blur' }
          ],
          readingNumber: [
            { required: true, message: '正在阅读数不能为空', trigger: 'blur' }
          ],
          press: [
            { required: true, message: '出版社不能为空', trigger: 'blur' }
          ],
          bookName: [
            { required: true, message: '书名不能为空', trigger: 'blur' }
          ],
          pressTime: [
            { required: true, message: '印刷时间不能为空', trigger: 'blur' }
          ],
          stars: [
            { required: true, message: '收藏不能为空', trigger: 'blur' }
          ],
          likes: [
            { required: true, message: '点赞数不能为空', trigger: 'blur' }
          ],
          price: [
            { required: true, message: '价格不能为空', trigger: 'blur' }
          ],
          summary: [
            { required: true, message: '摘要不能为空', trigger: 'blur' }
          ],
          coverPic: [
            { required: true, message: '图片的url地址不能为空', trigger: 'blur' }
          ],
          wordCount: [
            { required: true, message: '字数统计不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/lmsadmin/book/info/${this.dataForm.bookId}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.isDeleted = data.book.isDeleted
                this.dataForm.author = data.book.author
                this.dataForm.number = data.book.number
                this.dataForm.readingNumber = data.book.readingNumber
                this.dataForm.press = data.book.press
                this.dataForm.bookName = data.book.bookName
                this.dataForm.pressTime = data.book.pressTime
                this.dataForm.stars = data.book.stars
                this.dataForm.likes = data.book.likes
                this.dataForm.price = data.book.price
                this.dataForm.summary = data.book.summary
                this.dataForm.coverPic = data.book.coverPic
                this.dataForm.wordCount = data.book.wordCount
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
              url: this.$http.adornUrl(`/lmsadmin/book/${!this.dataForm.bookId ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'bookId': this.dataForm.bookId || undefined,
                'isDeleted': this.dataForm.isDeleted,
                'author': this.dataForm.author,
                'number': this.dataForm.number,
                'readingNumber': this.dataForm.readingNumber,
                'press': this.dataForm.press,
                'bookName': this.dataForm.bookName,
                'pressTime': this.dataForm.pressTime,
                'stars': this.dataForm.stars,
                'likes': this.dataForm.likes,
                'price': this.dataForm.price,
                'summary': this.dataForm.summary,
                'coverPic': this.dataForm.coverPic,
                'wordCount': this.dataForm.wordCount
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
