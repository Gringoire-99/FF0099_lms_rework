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
          <el-menu-item index="1">
            <el-icon>
              <Star/>
            </el-icon>
            <template #title>收藏</template>
          </el-menu-item>
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
                          <h3>{{ book.bookName }}</h3>
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
                        <el-button class="hvr-back-pulse" size="large"
                                   style="color: white;background-color: #2098D1;width: 130px">免费试读!
                        </el-button>
                        <el-button circle>
                          <el-icon>
                            <Star/>
                          </el-icon>
                        </el-button>
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
                  <h4>作品简介</h4>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid cumque est eveniet harum ipsam iure
                  libero maxime minus modi nihil nostrum placeat quibusdam quo rerum totam, vero voluptate voluptatibus?
                  Accusamus!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid cumque est eveniet harum
                  ipsam iure libero maxime minus modi nihil nostrum placeat quibusdam quo rerum totam, vero voluptate
                  voluptatibus? Accusamus!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid cumque est
                  eveniet harum ipsam iure libero maxime minus modi nihil nostrum placeat quibusdam quo rerum totam,
                  vero voluptate voluptatibus? Accusamus!
                  <p></p>
                  <h4>作品目录</h4>
                  <p></p>
                  <li>ipsam</li>
                  <li>harum</li>
                  <li>eveniet</li>
                  <li>rerum</li>
                </el-main>
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

            </el-col>
          </el-row>
        </el-main>

      </el-container>
    </el-container>

  </el-container>

</template>

<script>
import axios from "axios";

export default {
  name: "DetailPage"
  , data() {
    return {
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
      isCollapseNv: true,

    }
  },
  methods: {
    getBookDetail() {
      let bookId = this.bookId
      axios.get(`/api/book/info/${bookId}`).then(resolve => {
        this.book = resolve.data.book
      }, reason => {
        this.$errorPopUp("网络请求失败", "错误")
      })
    }
  },
  mounted() {

  },
  activated() {
    this.bookId = this.$route.query.bookId
    this.getBookDetail()
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
