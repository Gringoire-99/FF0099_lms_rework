<template>

  <el-row :gutter="20">
    <transition
        appear
        name="animate__animated"
        enter-active-class="animate__bounceIn"
    >
      <el-col :span="12">
        <el-container>
          <el-header class="hvr-fade">
            <h4>注册账号</h4>
          </el-header>
          <el-main class="hvr-border-fade">
            <el-form label-width="120px">
              <el-form-item label="手机号">
                <el-tooltip
                    class="box-item"
                    effect="dark"
                    content="请输入您的手机号"
                    placement="right-start"
                >
                  <el-input v-model="user.phoneNumber" type="number"/>
                </el-tooltip>
              </el-form-item>
              <el-form-item label="用户名">
                <el-tooltip
                    class="box-item"
                    effect="dark"
                    content="请输入您的姓名"
                    placement="right-start"
                >
                  <el-input v-model="user.userName"/>
                </el-tooltip>
              </el-form-item>
              <el-form-item label="用户密码">
                <el-tooltip
                    class="box-item"
                    effect="dark"
                    content="请输入您的密码"
                    placement="right-start"
                >
                  <el-input v-model="user.password" type="password" show-password/>
                </el-tooltip>
              </el-form-item>

              <el-form-item label="重复密码">
                <el-tooltip
                    class="box-item"
                    effect="dark"
                    content="确认你的密码输入无误"
                    placement="right-start"
                >
                  <el-input v-model="user.passwordRepeat" type="password" show-password/>
                </el-tooltip>
              </el-form-item>

              <el-form-item label="用户类型">
                <el-select placeholder="普通用户" >
                  <el-option label="普通用户" value="true"/>
                </el-select>
              </el-form-item>
              <el-form-item>
                <el-popconfirm
                    confirm-button-text="确定"
                    cancel-button-text="取消"
                    icon-color="#626AEF"
                    title="确认你的输入无误？"
                    @confirm="submit"
                >
                  <template #reference>
                    <el-button type="primary">提交</el-button>
                  </template>
                </el-popconfirm>

                <el-button>取消</el-button>
              </el-form-item>
            </el-form>
            <p></p>
            <el-progress :percentage="progress" :indeterminate="true" v-show="showProgress" :status="status"
                         :duration="1.5"/>
            <el-alert v-show="registerSuccessStatus" @close="registerSuccessStatus=false"
                      title="注册成功"
                      type="success"
                      :description="registerMessage"
                      show-icon
            />
            <el-alert v-show="registerFailStatus" @close="registerFailStatus=false"
                      title="注册失败"
                      type="error"
                      :description="registerMessage"
                      show-icon
            />
          </el-main>
        </el-container>
      </el-col>
    </transition>


    <el-col :span="12">
      <transition
          appear
          name="animate__animated animate__jackInTheBox"
          enter-active-class="animate__jackInTheBox"
          leave-active-class="animate__bounceOut">
        <el-col :span="12" class="grid-content">
          <el-container>
            <aside>
              <div class="separate"></div>
            </aside>
            <main>
              <h1 class="hvr-grow-shadow">
                <span style="color: #2259dc">加入</span>我们！<br>
                JOIN US!
                <p></p>
              </h1>
              <img src="../../assets/registerImg.svg" style="width: 500px" class="hvr-grow-shadow">
            </main>
          </el-container>
        </el-col>
      </transition>
    </el-col>
  </el-row>


</template>

<script>
import axios from "axios";
import {ElNotification} from "element-plus";

const checkData = function (user) {
  console.log(user)
  if (!/^1[34578][0-9]{9}$/.test(user.phoneNumber)){
    return '请输入合法手机'
  }
  if (!/^[\u4E00-\u9FA5A-Za-z\d_ ]+$/.test(user.userName)) {
    return '姓名为空或包含非法字符'
  }
  if (!/^[A-Za-z\d_ ]{6,30}$/.test(user.password)) {
    return '密码长度为6-30位，且不能包含特殊字符'
  }
  if (user.password !== user.passwordRepeat){
    return '两次输入的密码不一致'
  }

  return 'correct'

}
export default {
  name: "RegisterPage",
  data() {
    return {
      user: {
        phoneNumber:'',
        userName: '',
        password: '',
        passwordRepeat:''
      },
      registerSuccessStatus: false,
      registerFailStatus: false,
      registerMessage: '',

      showProgress: false,
      progress: 0,
      status: '',
      progressStatus: {'success': "success", "exception": "exception"}
    }
  },
  methods: {
    submit() {
      let registerMsg = ''
      let user = this.user
      let password = user.password
      let phoneNumber = user.phoneNumber
      registerMsg = checkData(user)
      if (registerMsg !== 'correct') {
        this.$warningPopUp(registerMsg,'注册失败')
        this.registerMessage = registerMsg
        this.registerFailStatus = true
        this.registerSuccessStatus =false
        return
      }
      new Promise((resolve, reject) => {
        axios.post('/api/user/save',user).then(result => {
          console.log(result)
          if (result.data.code!==0){
            reject()
          }
          resolve(result.data)
        },reason => {
          this.$errorPopUp(reason.code,'网络请求失败')
        })
      }).then(value => {
        this.$successPopUp('即将跳转页面','注册成功')
        axios.get('/api/user/login', {
          params: {
            password,
            phoneNumber
          }
        }).then(Response=>{
          console.log(Response.data)
          console.log(Response.data.user.userId)
          localStorage.setItem('userId',Response.data.user.userId)
        }).catch(reason => {
          this.$errorPopUp('服务器访问失败','请重新登录')
        })
        this.$store.state.isLogin = true

      },() => {
        this.$errorPopUp('该用户已存在','注册失败')
      })

    },
  },
}
</script>

<style scoped>
.separate {
  border-width: 1px;
  border-style: dashed;
  border-color: #2098D1;
  height: 100%;
  margin: 10px;
}
</style>
