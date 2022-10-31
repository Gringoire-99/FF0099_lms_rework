<template>
  <el-row :gutter="20">
    <transition
        appear
        enter-active-class="animate__bounceIn"
        leave-active-class="animate__bounceOut"
        name="animate__animated animate__jackInTheBox">
      <el-col :span="12" class="grid-content">

        <el-container @mouseleave="close">
          <el-header class="hvr-fade">
            <h4>{{ isLogin ? '重新登录？' : '登录账号' }}</h4>
          </el-header>
          <template class="hvr-border-fade">

            <el-main>
              <el-form>
                <el-form-item v-model=form label="手机号" type="number">
                  <el-tooltip
                      class="box-item"
                      content="请输入您的手机号"
                      effect="dark"
                      placement="right-start"
                  >
                    <el-input v-model="form.phone" type="number"/>
                  </el-tooltip>
                </el-form-item>
                <el-form-item label="密码">
                  <el-tooltip
                      class="box-item"
                      content="请输入您的密码"
                      effect="dark"
                      placement="right-start"
                  >
                    <el-input v-model="form.password" show-password type="password"/>
                  </el-tooltip>
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" @keydown.enter="submit  " @click="submit">登录</el-button>

                  <el-popconfirm
                      confirm-button-text="确定"
                      cancel-button-text="取消"
                      icon-color="#626AEF"
                      :title="isLogin?'确认退出吗':'取消登录？'"
                      @confirm="logout"
                  >
                    <template #reference>
                      <el-button>{{ isLogin ? '退出登录' : '取消' }}</el-button>
                    </template>
                  </el-popconfirm>
                </el-form-item>
              </el-form>
              <el-button @mouseenter="open">
                还没有账号？
              </el-button>
              <transition
                  appear
                  enter-active-class="animate__slideInRight"
                  leave-active-class="animate__zoomOut"
                  name="animate__animated animate__swing">
                <el-button v-show="showDetail" class="hvr-sweep-to-right" @click="pushRegisterPage">GO! 马上注册一个！
                  <el-icon>
                    <Promotion/>
                  </el-icon>
                </el-button>
              </transition>
              <p></p>
              <el-progress v-show="showProgress" :duration="1.5" :indeterminate="true" :percentage="progress"
                           :status="status"/>
              <el-alert v-show="loginStatusSuccess" :description="loginMessage"
                        show-icon
                        title="登录成功"
                        type="success"
                        @close="loginStatusSuccess=false"
              />
              <el-alert v-show="loginStatusFail" :description="loginMessage"
                        show-icon
                        title="登录失败"
                        type="error"
                        @close="loginStatusFail=false"
              />

            </el-main>

          </template>

        </el-container>

      </el-col>
    </transition>

    <transition
        appear
        enter-active-class="animate__jackInTheBox"
        leave-active-class="animate__bounceOut"
        name="animate__animated animate__jackInTheBox">
      <el-col :span="12" class="grid-content">
        <el-container>
          <aside>
            <div class="separate"></div>
          </aside>
          <main>
            <div class="hvr-grow-shadow">
              <h1>
                登录你的<span style="color: #2a35ff">账号！</span><br>
                Getting Started With LMS
              </h1>
            </div>
            <p></p>
            <img class="hvr-grow-shadow" src="../../assets/loginImg.svg" style="width: 500px">
          </main>

        </el-container>
      </el-col>
    </transition>

  </el-row>

</template>

<script>
import axios from 'axios'
import {ElNotification} from "element-plus";

export default {
  name: "LoginPage",
  data() {
    return {
      form: {
        phone: '',
        password: '',
      },
      showDetail: false,
      loginStatusFail: false,
      loginStatusSuccess: false,
      loginMessage: '',

      showProgress: false,
      progress: 0,
      status: '',
      progressStatus: {'success': "success", "exception": "exception"}
    }
  }, computed: {
    isLogin() {
      return this.$store.state.isLogin
    },
    userId() {
      return this.$store.state.userId
    }
  },
  methods: {
    submit() {
      //存在重复访问问题，需要添加请求拦截
      let timer;
      let phone = this.form.phone;
      let password = this.form.password
      if (phone.length === 0 || password.length === 0) {
        this.loginStatusFail = true
        this.loginStatusSuccess = false
        this.loginMessage = "手机或密码不能为空"
        return
      }
      let p = new Promise((resolve, reject) => {
        this.showProgress = true
        timer = setInterval(() => {
          this.progress += 20
        }, 1500)
        axios.get('/api/user/login', {
          params: {
            phone,
            password
          }
        }).then((Response => {
          console.log("服务器访问成功");
          resolve(Response.data)
        })).catch(reason => {
          console.log("服务器访问失败");
          reject(reason)
        })
      })
      //是否能访问服务器
      p.then(data => {
        console.log(data)
        if (data.msg==="success") return Promise.resolve(data)
        else return Promise.reject(data)
      }, reason => {
        this.loginMessage = '访问失败:' + reason.code
        this.loginStatusFail = true
        this.loginStatusSuccess = false
        //改变动画样式
        this.status = this.progressStatus['exception']
        //等待两秒关闭进度条动画
        setTimeout(() => {
          clearInterval(timer)
          this.loginStatusFail = true
          this.loginStatusSuccess = false
          setTimeout(() => {
            this.loginStatusFail = false
            this.showProgress = false
            this.status = ''
            this.progress = 0;
          }, 4000)
        }, 2000)
      }).
          //是否能登录到服务器
          then(data => {
            localStorage.setItem('userId', data.user.userId)
            this.loginMessage = '登录成功 code:' + data.code
            this.loginStatusFail = false
            this.loginStatusSuccess = true
            //改变动画样式
            this.status = this.progressStatus['success']
            //等待两秒关闭进度条动画
            new Promise((resolve)=>{
              setTimeout(() => {
                resolve()
              }, 2000)
            }).then(()=>{
              setTimeout(() => {
                clearInterval(timer)
                this.loginStatusSuccess = false
                this.showProgress = false
                this.status = ''
                this.progress = 0;
                // this.$router.push('/UserPage')
                setTimeout(() => {
                  location.reload()
                }, 500)
              }, 1000)
            })



          }, reason => {
            this.loginMessage = '手机号或密码错误 code:' + reason.code
            this.loginStatusFail = true
            this.loginStatusSuccess = false
            //改变动画样式
            this.status = this.progressStatus['exception']
            //等待两秒关闭进度条动画
            setTimeout(() => {
              setTimeout(() => {
                clearInterval(timer)
                this.loginStatusFail = false
                this.showProgress = false
                this.status = ''
                this.progress = 0;
              }, 5000)
            }, 2000)
          })
    },
    logout() {
      if (this.isLogin){
        localStorage.clear()
        location.reload()
      }
      this.form.id=''
      this.form.password=''
    }
    ,
    pushRegisterPage() {
      this.$router.replace('/RegisterPage');
    },
    open() {
      this.showDetail = true
    },
    close() {
      this.showDetail = false

    },
    warningPopUp(message, title) {
      ElNotification({
        title,
        message,
        type: 'warning',
      })
    },
    successPopUp(message, title) {
      ElNotification({
        title,
        message,
        type: 'success',
      })
    }

  },
  mounted() {
    if (this.isLogin) {
      this.successPopUp('您已登录，是否要退出登录？', '已登录')
    } else {
      this.warningPopUp('您还未登录请先登录', '未登录')
    }
  }


}
</script>

<style scoped>
el-row {
  margin-bottom: 20px;
}

el-row:last-child {
  margin-bottom: 0;
}

el-col {
  border-radius: 4px;
}

.grid-content {
  border-radius: 4px;
  min-height: 36px;
}

.separate {
  border-width: 1px;
  border-style: dashed;
  border-color: #2098D1;
  height: 100%;
  margin: 10px;
}

el-container {
  margin-bottom: 20px;
}
</style>
