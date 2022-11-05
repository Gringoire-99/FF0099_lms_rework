<template>
  <el-container style="background-color: black;color: white;">
    <el-aside width="50px">
    </el-aside>
    <el-main>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-container>

            <el-header>
              LMS你的图书管理系统
            </el-header>

            <el-main>

              <h1><span class="hvr-grow-shadow">高效管理<span style="color: #f8a857">你的书籍！</span> </span></h1>


              <div style="height: 30px;"></div>
              <div class="hvr-grow-shadow" style="padding: 5px">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab adipisci amet, aperiam aut deleniti dolores
                eum exercitationem impedit laboriosam maxime pariatur, reiciendis repudiandae, tempore? Alias facilis
                maxime numquam obcaecati qui?
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Autem culpa cum deserunt nesciunt quibusdam
                similique tempora tenetur, veniam? Aspernatur blanditiis dolores facilis minima nemo nulla quo sapiente
                sequi? Quia, reprehenderit.
              </div>
            </el-main>
            <el-footer>
              <el-button type="primary" style="background-color: #1575d7;font-style: oblique;" class="hvr-grow-rotate" @click="pushBookListPage">
                立即开启图书之旅！
              </el-button>
            </el-footer>
          </el-container>
        </el-col>

        <el-col :span="12">
          <el-container>

            <el-header>
              <el-row>
                <el-col :span="12">

                </el-col>
                <el-col :span="12">
                  <span style="color: #a9a4a4">
                  图书管理&nbsp;&nbsp;图书借阅&nbsp;&nbsp;图书搜索
                  </span>
                </el-col>
              </el-row>
            </el-header>

            <el-main>
              <img class="hvr-grow-shadow" src="../../assets/homePage_1.svg" style="width: 500px">
            </el-main>
          </el-container>
        </el-col>
      </el-row>
    </el-main>
    <el-footer style="background-color: #0794ff" height="90px">
      <el-container>
        <el-aside width="20px"></el-aside>
        <el-main>
          <el-row>
            <el-col :span="12">
              <span style="font-size: 30px">
              现在就注册账号 加入我们吧！
              </span>
            </el-col>
            <el-col :span="12">

              <el-input style="height: 40px;width: 500px;margin-top: 5px" placeholder="输入你的学号">
              </el-input>
              <el-button type="info" style="background-color: #282020;color: white;height: 43px" @click="pushRegisterPage">
                注册
              </el-button>

            </el-col>
          </el-row>
        </el-main>
      </el-container>
      <el-container>
        <el-header>

        </el-header>
        <el-main>
          <el-row :gutter=20>
            <el-col :span="8">
              <el-card style="background-color: #413d3d;color: white" class="hvr-grow-shadow">
                  <div class="card-header">
                    <h4 style="text-align: center">图书管理</h4>
                  </div>
                <span >Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam aliquid debitis delectus dignissimos dolore dolores, eaque eum expedita illo iure, nobis odio pariatur quae quidem quo sed tenetur vel vero!</span>
                <div>
                  <el-button class="el-button--primary" style="margin: 20px 150px">
                    了解一下
                  </el-button>
                </div>
              </el-card>
            </el-col>
            <el-col :span="8">
              <el-card style="background-color: #787575;color: white" class="hvr-grow-shadow">
                <div class="card-header">
                  <h4 style="text-align: center">图书借阅</h4>
                </div>
                <span >Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam aliquid debitis delectus dignissimos dolore dolores, eaque eum expedita illo iure, nobis odio pariatur quae quidem quo sed tenetur vel vero!</span>
                <div>
                  <el-button class="el-button--primary" style="margin: 20px 150px">
                    了解一下
                  </el-button>
                </div>
              </el-card>
            </el-col>
            <el-col :span="8">
              <el-card style="background-color: #413d3d;color: white" class="hvr-grow-shadow">
                <div class="card-header">
                  <h4 style="text-align: center">图书搜索</h4>
                </div>
                <span >Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam aliquid debitis delectus dignissimos dolore dolores, eaque eum expedita illo iure, nobis odio pariatur quae quidem quo sed tenetur vel vero!</span>
                <div>
                  <el-button class="el-button--primary" style="margin: 20px 150px">
                    了解一下
                  </el-button>
                </div>
              </el-card>
            </el-col>
          </el-row>
        </el-main>
        <el-footer>
          <el-main>
            <el-row :gutter="20">
              <el-col :span="12">
                <img src="../../assets/homepagebookmanage.jpg" style="width: 600px;height: 400px">
              </el-col>
              <el-col :span="12">
                <el-card class="box-card" shadow="hover">
                  <template #header>
                    <div class="card-header">
                      <h4>
                        功能介绍
                      </h4>
                    </div>
                  </template>
                  <span>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus facere maiores neque! Asperiores consequuntur culpa dignissimos, eveniet exercitationem fugiat impedit laudantium magnam omnis quidem saepe sapiente soluta tempora totam ullam.
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet deserunt dolorem doloremque nulla vel voluptates. Adipisci architecto ea eum excepturi molestias repellat sunt. Dolore excepturi iusto odit rerum unde. Officia.
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam assumenda at distinctio ducimus, eaque, facere fugit hic ipsam labore nam nemo nihil pariatur porro possimus quasi sapiente suscipit voluptate. Necessitatibus?
                  </span>
                  <p></p>
                  <div>
                    <el-button class="el-button--primary" >
                      查看更多
                    </el-button>
                  </div>
                </el-card>
              </el-col>
            </el-row>
            <p></p>
          </el-main>
        </el-footer>
      </el-container>
    </el-footer>

  </el-container>
</template>

<script>
export default {
  name: "HomePage",
  methods:{
    pushRegisterPage(){
      this.$router.push('/RegisterPage')
    },
    pushBookListPage(){
      this.$router.push('/BookListPage')
    }
  }
}
</script>

<style scoped>
el-container {
}

el-aside {
}

* {
  overflow: visible;
}
</style>