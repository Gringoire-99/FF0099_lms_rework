<template>
  <el-container>
    <el-header>
      <el-page-header @back="$router.back()" content="详情页面">
      </el-page-header>

    </el-header>
    <el-container>
      <el-aside width="60">
        <el-menu
            default-active="2"
            :collapse="isCollapseNv"
        >
          <el-popconfirm
              cancel-button-text="算了"
              confirm-button-text="好"
              icon-color="#626AEF"
              :title="isFavorite?'取消收藏？':'收藏此书？'"
              @confirm="handleFavorite"
          >
            <template #reference>
              <el-menu-item index="1">
                <el-icon v-show="isFavorite">
                  <img src="../../assets/star.svg" style="width: 20px;height: 20px">
                </el-icon>
                <el-icon v-show="!isFavorite">
                  <Star/>
                </el-icon>
                <template #title>收藏</template>
              </el-menu-item>
            </template>
          </el-popconfirm>

          <el-menu-item index="2">
            <el-icon>
              <Pointer/>
            </el-icon>
            <template #title>点赞</template>
          </el-menu-item>
          <el-menu-item index="3">
            <el-icon>
              <Share/>
            </el-icon>
            <template #title>分享</template>
          </el-menu-item>
          <el-menu-item index="4">
            <el-icon>
              <ChatLineSquare/>
            </el-icon>
            <template #title>评论</template>
          </el-menu-item>
        </el-menu>
      </el-aside>
      <el-container>
        <el-main>
          <el-row :gutter="20">
            <el-col :span="16">
              <el-container>
                <el-main>
                  <el-card class="box-card hvr-border-fade">

                    <el-row :gutter="10">
                      <el-col :span="12">
                        <el-image :src="book.coverPic"
                                  style=" width: 300px;height: 300px;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);"
                                  class="hvr-grow-shadow"></el-image>
                      </el-col>
                      <el-col :span="12">
                        <div class="hvr-fade" style="width: 322px">
                          <h3>《{{ book.bookName }}》</h3>
                          <p></p>
                        </div>

                        <el-descriptions
                            :column="1"
                            border
                            class="hvr-grow-shadow"
                        >
                          <el-descriptions-item label="作者">{{ book.author }}</el-descriptions-item>
                          <el-descriptions-item label="类别">
                            <el-tag size="small">小说</el-tag>
                            <el-tag size="small">传统</el-tag>
                          </el-descriptions-item>
                          <el-descriptions-item label="出版社">{{ book.press }}</el-descriptions-item>
                          <el-descriptions-item label="出版时间">{{ book.pressTime }}</el-descriptions-item>
                          <el-descriptions-item label="评分"
                          >
                            <el-rate
                                v-model="book.score"
                                :texts="['oops', 'disappointed', 'normal', 'good', 'great']"
                                show-text
                            />

                          </el-descriptions-item>

                        </el-descriptions>

                        <p></p>
                        <img style="height: 15px;width: 15px"
                             src="../../assets/hot.svg"/><span style="margin-right: 15px">{{ book.likes }}人点赞</span>
                        <img style="height: 15px;width: 15px"
                             src="../../assets/star.svg"/><span style="margin-right: 15px">{{ book.stars }}人收藏</span>
                        <img style="height: 15px;width: 15px"
                             src="../../assets/comment.svg"/><span>{{ 0 }}人评论</span>
                        <p></p>

                        <el-button class="hvr-back-pulse" size="large"
                                   style="color: white;background-color: #2098D1;width: 130px">免费试读!
                        </el-button>
                        <el-popconfirm
                            cancel-button-text="取消"
                            confirm-button-text="好"
                            icon-color="#626AEF"
                            :title="isFavorite?'取消收藏？':'收藏此书？'"
                            @confirm="handleFavorite"
                        >
                          <template #reference>
                            <el-button circle>
                              <el-icon>
                                <Star/>
                              </el-icon>
                            </el-button>
                          </template>
                        </el-popconfirm>

                        <el-button circle>
                          <el-icon>
                            <ChatLineRound/>
                          </el-icon>
                        </el-button>
                        <el-button circle>
                          <el-icon>
                            <Share/>
                          </el-icon>
                        </el-button>
                        <el-button circle>
                          <el-icon>
                            <Pointer/>
                          </el-icon>
                        </el-button>

                      </el-col>
                    </el-row>
                  </el-card>
                </el-main>
                <el-footer>
                  <el-row :gutter="1"
                          style="background-color: #F6FBFC;box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.2);height: 50px;padding-top: 10px;padding-left: 15px">
                    <el-col :span="16">全本定价：<span style="font-weight: bold;color: #5DCAAD">￥{{ book.price }}</span>
                    </el-col>
                    <el-col :span="4" style="font-weight: bold;color: #5DCAAD;">
                      <button style="border-color: #5DCAAD;background-color: #5DCAAD;color: white;"
                              class="hvr-pulse-grow">购买电子书
                      </button>
                    </el-col>
                    <el-col :span="2" style="font-weight: bold;color: #5DCAAD">
                      <el-icon size="30px">
                        <GoodsFilled/>
                      </el-icon>
                    </el-col>
                    <el-col :span="2" style="font-weight: bold;color: #5DCAAD">
                      <el-icon size="30px">
                        <CollectionTag/>
                      </el-icon>
                    </el-col>
                  </el-row>

                </el-footer>
              </el-container>
              <p></p>
              <el-container>
                <el-main>
                  <h4>
                    <el-icon>
                      <Collection/>
                    </el-icon>
                    作品简介
                  </h4>
                  {{ book.summary }}
                  <p></p>
                  <h4>
                    <el-icon>
                      <Reading/>
                    </el-icon>
                    作品目录
                  </h4>
                  <p></p>
                  <li>ipsam</li>
                  <li>harum</li>
                  <li>eveniet</li>
                  <li>rerum</li>
                </el-main>
                <el-footer>
                  <el-card>
                    <div v-show="$store.state.isLogin">
                      <h4>
                        <el-icon>
                          <ChatLineSquare/>
                        </el-icon>
                        评论
                      </h4>
                      <div>
                        <el-row :gutter="2">
                          <el-col :span="2">
                            <el-avatar :src="user.avatarPic">
                            </el-avatar>
                          </el-col>
                          <el-col :span="20">
                            <el-input type="textarea" v-model="comment.content"></el-input>
                          </el-col>
                          <el-col :span="2">
                            <el-popconfirm
                                cancel-button-text="算了"
                                confirm-button-text="发布"
                                icon-color="#626AEF"
                                title="发布评论？"
                                @confirm="handleComment"
                            >
                              <template #reference>
                                <el-button size="large" type="primary" style="height: 52px">发布</el-button>
                              </template>
                            </el-popconfirm>
                          </el-col>
                        </el-row>

                        <p></p>
                        <el-row :gutter="2">
                          <el-col :span="2">
                          </el-col>
                          <el-col :span="22" style="margin-bottom: 15px"> <span>给这个作品打个分吧！<el-rate
                              v-model="comment.score"
                              :texts="['oops', 'disappointed', 'normal', 'good', 'great']"
                              show-text
                          /></span></el-col>
                          <hr>
                          <p></p>
                          <el-row :gutter="2" v-for="(comment,index) in comments" :key="index" style="margin-top: 10px">
                            <el-col :span="2">
                              <el-avatar :src="comment.avatarPic"></el-avatar>
                            </el-col>
                            <el-col :span="20">
                              <div style="width: 700px;">
                                <el-link type="primary">{{ comment.userName }}:</el-link>
                                <br>
                                {{ comment.content }}
                                <p></p>
                                <el-rate style="margin-right: 10px"
                                         :texts="['oops', 'disappointed', 'normal', 'good', 'great']"
                                         show-text v-model="comment.score"></el-rate>
                                <span>
                                   点赞
                                <el-button style="height: 15px;width: 15px" type="danger" plain circle><img
                                    style="height: 15px;width: 15px"
                                    src="../../assets/like.svg"/></el-button>
                                {{ comment.likes }}
                                </span>
                                <span>  踩<el-button style="height: 15px;width: 15px" type="info" plain circle><img
                                    style="height: 15px;width: 15px"
                                    src="../../assets/dislike.svg"/></el-button>
                                {{ comment.dislikes }}

                               </span>

                                <hr>
                              </div>

                            </el-col>
                          </el-row>
                        </el-row>
                      </div>
                      <hr>

                      <el-pagination
                          :hide-on-single-page="true"
                          @size-change="sizeChangeHandle"
                          @current-change="currentChangeHandle"
                          v-model:currentPage="pageIndex"
                          v-model:page-size="pageSize"
                          :page-sizes="[5,10,20,40]"
                          :background="true"
                          layout="total, sizes, prev, pager, next, jumper"
                          :total="totalPage"
                      />
                    </div>
                    <div v-show="!$store.state.isLogin">
                      <h2>请先登录</h2>
                    </div>
                  </el-card>
                </el-footer>
              </el-container>
            </el-col>

            <el-col :span="8">
              <h4>出版方</h4>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid aspernatur culpa illo incidunt, ipsum
              iure necessitatibus praesentium quo unde voluptates! Adipisci aliquam delectus eius, facere nihil qui
              reiciendis temporibus voluptatem!
              <p></p>
              （广告👇）
              <p></p>
              <el-carousel height="250px">
                <el-carousel-item v-for="item in 4" :key="item">
                  <h3 class="small justify-center" text="2xl">{{ item }}</h3>
                </el-carousel-item>
              </el-carousel>
              <p></p>
              <h4>下载lmsApp!</h4>
              <p></p>
              <img src="../../assets/ad.png" style="width: 350px" class="hvr-grow-shadow">
              <p></p>
              <h4>作品标签（未实装）</h4>
              <el-space wrap>
                <el-tag size="large">小说</el-tag>
                <el-tag size="large">当代文学</el-tag>
                <el-tag size="large">人生</el-tag>
                <el-tag size="large">中国文学</el-tag>
                <el-tag size="large">经典</el-tag>
              </el-space>
            </el-col>
          </el-row>
        </el-main>

      </el-container>
    </el-container>
    <el-aside>

    </el-aside>
  </el-container>

</template>

<script>
import axios from "axios";

export default {
  name: "DetailPage"
  ,
  data() {
    return {
      pageIndex: 1,
      pageSize: 10,
      totalPage: 0,
      orderField: 'c.comment_time',
      order: 'desc',
      icons: {},
      bookId: '',
      book: {
        bookId: "",
        author: "",
        number: 0,
        readingNumber: 0,
        press: "",
        bookName: "",
        pressTime: "",
        stars: 0,
        likes: 0,
        price: 0,
        summary: "",
        coverPic: "",
        score: 0,
        wordCount: 0
      },
      isFavorite: false,
      user: {
        avatarPic: '',
        userId: '',
        userName: ''
      }
      ,
      isCollapseNv: true,
      comment: {
        content: '',
        userId: '',
        commentTime: '',
        score: 3.5,
        bookId: ''
      },
      comments: []
    }
  },
  methods: {
    sizeChangeHandle(val) {
      this.pageSize = val
      this.currentPage = 1
      this.getComments()
    },
    // 当前页
    currentChangeHandle(val) {
      this.currentPage = val
      this.getComments()
    },
    handleComment() {
      let comment = this.comment
      comment.bookId = this.bookId
      comment.commentTime = this.$currentDateTime()
      comment.userId = this.user.userId
      axios.post("/api/comment/save", comment).then(({data}) => {
        if (data.code !== 0) {
          this.$errorPopUp(data.msg, "评论失败")
        }
        this.$successPopUp(data.msg, "评论成功")
        this.getComments()
      }, reason => {
        this.$errorPopUp("网络故障", "评论失败")
      })
    },
    getBookDetail() {
      let bookId = this.bookId
      axios.get(`/api/book/info/${bookId}`).then(({data}) => {
        if (data.code !== 0 || !data) {
          this.$errorPopUp(data.msg, "错误")
          return
        }
        this.book = data.book
      }, reason => {
        this.$errorPopUp("网络请求失败", "错误")
      })

    },
    getUserData() {
      let userId = localStorage.getItem("userId")
      if (this.$store.state.isLogin&&userId&&userId!=='') {
        //挂载时申请用户的详细数据
        let bookId = this.bookId
        axios.get(`/api/user/info/${userId}`).then(value => {
          if (value.data.code !== 0) {
            this.$errorPopUp('获取时发生错误', '获取信息失败')
            return
          }
          this.user = value.data.user
          this.getFavoriteState(bookId,userId)
        }, reason => {
          this.$errorPopUp(reason.code, '服务器未响应')
        })
      }
    },
    getComments() {
      axios.get("/api/comment/comments", {
        params: {
          limit: this.pageSize,
          page: this.pageIndex,
          bookId: this.bookId,
          orderField: this.orderField,
          order: this.order
        }
      }).then(({data}) => {
        if (data.code !== 0) {
          this.$errorPopUp(data.msg, "评论加载失败")
          this.comments = []
          return
        }
        this.totalPage = data.page.totalCount
        this.comments = data.page.list
      }, reason => {
        this.$errorPopUp(reason.code, "评论加载失败")
        this.comments = []
        this.totalPage = 0
      })
    },
    handleFavorite() {
      let userId = this.user.userId
      let bookId = this.bookId
      let url = `http://localhost:8081/#/DetailPage?bookId=${bookId}`
      console.log(userId)
      if (userId === '' || !userId) {
        this.$errorPopUp("请先登录！", "错误")
        return
      }
      let favorites = {
        bookId,
        userId,
        url
      }
      axios.post("/api/favorites/save", favorites).then(({data}) => {
        if (data.code !== 0) {
          this.$errorPopUp(data.msg, "错误")
          return
        }
        this.$successPopUp(data.msg, "操作成功")
        this.isFavorite = !this.isFavorite
        this.getBookDetail()
      }, reason => {
        this.$errorPopUp(reason.code, "错误")
      })
    },
    getFavoriteState(bookId,userId){
      axios.get(`/api/favorites/info/${bookId}/${userId}`).then(({data}) => {
        if (data.code !== 0 || !data) {
          this.$errorPopUp(data.msg, "错误")
          return
        }
        if (data.favorites != null) {
          this.isFavorite = true
        }else {
          this.isFavorite=false
        }

      }, reason => {
        this.$errorPopUp(reason.msg, "错误")
      })
    }
  },
  mounted() {

  },
  activated() {
    this.bookId = this.$route.query.bookId
    this.getBookDetail()
    this.getUserData()
    this.getComments()
  }
}
</script>

<style scoped>
.el-carousel__item h3 {
  color: #475669;
  opacity: 0.75;
  line-height: 150px;
  margin: 0;
  text-align: center;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}
</style>
