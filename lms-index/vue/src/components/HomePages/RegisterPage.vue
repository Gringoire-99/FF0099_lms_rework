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
              <el-form-item label="学号">
                <el-tooltip
                    class="box-item"
                    effect="dark"
                    content="请输入您的学号"
                    placement="right-start"
                >
                  <el-input v-model="form.id" type="number"/>
                </el-tooltip>
              </el-form-item>
              <el-form-item label="用户姓名">
                <el-tooltip
                    class="box-item"
                    effect="dark"
                    content="请输入您的姓名"
                    placement="right-start"
                >
                  <el-input v-model="form.name"/>
                </el-tooltip>
              </el-form-item>
              <el-form-item label="用户密码">
                <el-tooltip
                    class="box-item"
                    effect="dark"
                    content="请输入您的密码"
                    placement="right-start"
                >
                  <el-input v-model="form.password" type="password" show-password/>
                </el-tooltip>
              </el-form-item>
              <el-form-item label="用户类型">
                <el-select v-model="form.role" placeholder="选择你的角色">
                  <el-option label="普通用户" value="user"/>
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

const checkData = function (data) {
  if (data === null) return false
  if (!/^\d{6,20}$/.test(data.userId)) {
    return 'Id长度为6-20位，只能包含数字'
  }
  if (!/^[\u4E00-\u9FA5A-Za-z\d_ ]+$/.test(data.userName)) {
    return '姓名为空或包含非法字符'
  }
  if (!/^[A-Za-z\d_ ]{6,30}$/.test(data.userPassword)) {
    return '密码长度为6-30位，且不能包含特殊字符'
  }

  return 'correct'

}
export default {
  name: "RegisterPage",
  data() {
    return {
      form: {
        id: '',
        name: '',
        password: '',
        role: ''
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
      let user = {
        role:'user',
        birthdate:null,
        gender:null,
        remark:null
      }
      user.userId = this.form.id;
      user.userName = this.form.name;
      user.userPassword = this.form.password;
      registerMsg = checkData(user)
      if (registerMsg !== 'correct') {
        this.warningPopUp(registerMsg,'注册失败')
        this.registerMessage = registerMsg
        this.registerFailStatus = true
        this.registerSuccessStatus =false
        return
      }
      new Promise((resolve, reject) => {
        axios.post('/api/register',user).then(value => {
          if (value.data.code!==200){
            reject()
          }
          resolve(value.data)
        },reason => {
          this.errorPopUp(reason.code,'网络请求失败')
        })
      }).then(value => {
        this.successPopUp('即将跳转页面','注册成功')
        console.log(value);
        localStorage.setItem('userName', value.data.userName)
        localStorage.setItem('userId', value.data.userId)
        localStorage.setItem('gender', value.data.gender)
        localStorage.setItem('remark', value.data.remark)
        localStorage.setItem('birthdate', value.data.birthdate)
        localStorage.setItem('role', value.data.role) //待加密
        this.$router.push('/UserPage')
        setTimeout(()=>{
          location.reload()
        },500)
      },() => {
        this.errorPopUp('该用户已存在','注册失败')
      })

    },
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