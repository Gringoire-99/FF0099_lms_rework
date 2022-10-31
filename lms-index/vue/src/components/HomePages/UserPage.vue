<template>
  <el-row :gutter="20">
    <el-col :span="12">
      <transition
          appear
          enter-active-class="animate__bounceIn"
          name="animate__animated"
      >
        <el-container>
          <el-header class="hvr-fade">
            <h4>我的信息</h4>
          </el-header>
          <div class="hvr-border-fade">
            <el-main>

              <el-form>
                <el-form-item label="头像">
                  <el-avatar :size="20" :src="user.avatarPic" />
                </el-form-item>
                <el-form-item label="用户名">
                  <el-input v-model="user.userName"/>
                </el-form-item>
                <el-form-item label="性别">
                  <el-select v-model="user.gender" placeholder="请选择你的性别">
                    <el-option label="男" value="male"/>
                    <el-option label="女" value="female"/>
                  </el-select>
                </el-form-item>
                <el-form-item label="邮箱">
                  <el-input v-model="user.email"/>
                </el-form-item>
                <el-form-item label="手机号">
                  <el-input v-model="user.phoneNumber"/>
                </el-form-item>
                <el-form-item label="余额">
                  <el-tag class="ml-2" type="warning">{{user.balance}}</el-tag>
                </el-form-item>
                <el-form-item label="借阅数">
                  <el-tag class="ml-2" >{{user.borrowNumber}}</el-tag>
                </el-form-item>
                <el-form-item label="出生日期">
                  <el-col :span="11">
                    <el-date-picker
                        v-model="user.birthdate"
                        placeholder="选择日期"
                        style="width: 100%"
                        type="date"
                        value-format="YYYY-MM-DD"

                    />
                  </el-col>
                  <el-col :span="2" class="text-center">
                    <span class="text-gray-500">-</span>
                  </el-col>
                  <el-col :span="11">
                    <!-- 待添加模型-->
                    <el-time-picker
                        placeholder="选择时间"
                        style="width: 100%"
                    />
                  </el-col>
                </el-form-item>
                <el-form-item label="备注">
                  <el-input v-model="user.remark" type="textarea"/>
                </el-form-item>
                <el-form-item>
                  <el-popconfirm
                      cancel-button-text="算了"
                      confirm-button-text="是"
                      icon-color="#626AEF"
                      title="确定要修改信息吗？"
                      @confirm="updateUser"
                  >
                    <template #reference>
                      <el-button type="primary">保存</el-button>
                    </template>
                  </el-popconfirm>
                  <el-button>取消</el-button>
                </el-form-item>
              </el-form>
            </el-main>
            <el-footer>
              <el-icon class="hvr-grow-shadow ">
                <Reading/>
              </el-icon>
              <el-icon class="hvr-grow-shadow">
                <Bell/>
              </el-icon>
              <el-icon class="hvr-grow-shadow">
                <Star/>
              </el-icon>
            </el-footer>
          </div>
          <hr>
          <el-container>
            <el-header class="hvr-fade">
              <h4>
                图书借阅
              </h4>
            </el-header>
            <el-main class="hvr-border-fade">
              <el-collapse>
                <el-collapse-item name="1" title="正在读">
                  <div>
                    <el-descriptions :column="3" border>
                      <el-descriptions-item
                          align="center"
                          class-name="my-content"
                          label="书名"
                          label-align="right"
                          label-class-name="my-label"
                          width="150px"
                      >{{ readingBook.bookName }}
                      </el-descriptions-item
                      >
                      <el-descriptions-item align="center" label="图书编号" label-align="right"
                      >{{ readingBook.bookId }}
                      </el-descriptions-item
                      >
                      <el-descriptions-item align="center" label="作者" label-align="right"
                      >{{ readingBook.bookAuthor }}
                      </el-descriptions-item
                      >
                      <el-descriptions-item align="center" label="还书时间" label-align="right">
                        <el-tag size="small">{{ returnDate }}</el-tag>
                      </el-descriptions-item>
                      <el-descriptions-item align="center" label="描述" label-align="right"
                      >{{ readingBook.remark }}
                      </el-descriptions-item
                      >
                      <el-descriptions-item align="center" label="出版社" label-align="right"
                      >{{ readingBook.press }}
                      </el-descriptions-item
                      >
                    </el-descriptions>
                  </div>
                </el-collapse-item>
                <el-collapse-item name="2" title="收藏图书">
                  <div>
                    施工中
                  </div>
                </el-collapse-item>
                <el-collapse-item name="3" title="待还">
                  <div>
                    <el-timeline>
                      <el-timeline-item
                          v-for="(activity, index) in records"
                          :key="index"
                          :timestamp="activity.returnDate"
                      >
                        还书号：{{ activity.borrowBookId }}
                      </el-timeline-item>
                    </el-timeline>
                  </div>
                </el-collapse-item>
              </el-collapse>
            </el-main>
          </el-container>

        </el-container>
      </transition>

    </el-col>
    <transition
        appear
        enter-active-class="animate__jackInTheBox"
        leave-active-class="animate__bounceOut"
        name="animate__animated animate__jackInTheBox">

      <el-col :span="12">
        <el-container>
          <aside>
            <div class="separate"></div>
          </aside>
          <main>
            <div class="hvr-grow-shadow">
              <h1>
                欢迎使用<span style="color: #0794ff">LMS！</span><br>
              </h1>
              <span>
                尊敬的用户：{{ user.userName }}
              </span>
            </div>
            <p></p>
            <img class="hvr-grow-shadow" src="../../assets/userPageImg.svg" style="width: 500px">
          </main>
        </el-container>
      </el-col>
    </transition>
  </el-row>


</template>
<script>
import {ElNotification} from 'element-plus'
import axios from "axios";
//待包装
const checkData = function (user) {
  if (!/^[\u4E00-\u9FA5A-Za-z\d_ ]+$/.test(user.userName)){
    return '姓名为空或包含非法字符'
  }
  if (!/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.(com|cn|net)$/.test(user.email)){
    return '请输入合法邮箱'
  }
  if (!/^1[34578][0-9]{9}$/.test(user.phoneNumber)){
    return '请输入合法手机'
  }
  return 'correct'

}
export default {
  data() {
    return {
      user: {
        userName: '',
        userId: '',
        gender: '',
        remark: '',
        email:'',
        avatarPic:'',
        balance:0,
        phoneNumber:'',
        borrowNumber:0
      },
      records: [],
      readingBook: {
        bookAuthor: '',
        bookId: '',
        bookName: '',
        bookPrice: '',
        borrowNum: '',
        press: '',
        remark: '',
      },
      returnDate: ''
    }
  },

  computed: {

  },
  methods: {
    warningPopUp(message, title) {
      ElNotification({
        title,
        message,
        type: 'warning',
      })
    },
    errorPopUp(message, title) {
      ElNotification({
        title,
        message,
        type: 'error',
      })
    },
    successPopUp(message, title) {
      ElNotification({
        title,
        message,
        type: 'success',
      })
    },
    updateUser() {
      let updateMsg=''
     let user = this.user
      updateMsg = checkData(user)
      if (updateMsg !=='correct'){
        this.warningPopUp(updateMsg,'输入有误')
        return
      }

      axios.post('/api/user/update',user
      ).then(() => {
        this.successPopUp('数据已递交', '修改成功')

      }, () => {
        this.errorPopUp('网络未响应', '修改失败')
      })
    }
  }, mounted() {
    if (this.$store.state.isLogin) {
      //挂载时申请用户的详细数据
      let userId = localStorage.getItem("userId")
      new Promise(() => {
        axios.get(`/api/user/info/${userId}`).then(value => {
          if (value.data.code !== 0) {
            this.errorPopUp('获取时发生错误', '获取信息失败')
            return
          }
          if (value.data.user !== null) {
            this.user = value.data.user;
            console.log(this.user)
            // this.records = value.data.data.records
            // this.readingBook = value.data.data.readingBook
            // this.returnDate = this.records[0].returnDate
          }
        }, reason => {
          this.errorPopUp(reason.code, '服务器未响应')
        })

      })
    }

  }

}
</script>

<style>

</style>
