<template>
  <transition
      appear
      name="animate__animated "
      enter-active-class="animate__fadeInLeft"
      leave-active-class="animate__bounceOut">
    <div>
      <el-container>
        <el-header>
          <div class="h-6"/>
          <el-menu
              class="el-menu-demo"
              mode="horizontal"
              background-color="#545c64"
              text-color="#fff"
              active-text-color="#ffd04b"
          >
            <el-menu-item index="1" @click="openFilter">筛选</el-menu-item>
            <el-menu-item index="2" @mouseenter="openSearch">搜索</el-menu-item>
            <el-menu-item index="3" @click="reset()">重置</el-menu-item>
            <el-menu-item index="4" @click="getDataList">刷新</el-menu-item>
          </el-menu>

        </el-header>
        <el-main>
          <transition
              appear
              name="animate__animated"
              enter-active-class="animate__bounceIn"
              leave-active-class="animate__bounceOut"
          >
            <div v-show="isOpenSearch" style="width: 500px;display: flex">

              <el-input
                  placeholder="请输入查找关键词"
                  v-model="keyWord"
                  @keydown.enter="getDataList"
              ></el-input>
              <el-button @click="getDataList" size="large" style="margin-left: 10px;margin-top: 7px">
                <el-icon :size="25">
                  <Search/>
                </el-icon>
              </el-button>
              <el-select class="m-2" placeholder="Select" size="large" v-model="keyProp">
                <el-option
                    v-for="(prop,index) in props"
                    :key="index"
                    :label="prop"
                    :value="prop"
                />
              </el-select>

            </div>
          </transition>
          <el-table :data="dataList" style="width: 100%"
                    :stripe="true"
                    :border="true"
                    height="600"
                    max-height="600"
                    :default-sort="{ prop: 'bookId', order: 'descending' }"
                    @row-dblclick="goDetail"

          >
            <!--     折叠子面板      -->
            <el-table-column type="expand">
              <template #default="props">
                <transition
                    appear
                    name="animate__animated "
                    enter-active-class="animate__fadeIn"
                    leave-active-class="animate__bounceOut">
                  <el-container>
                    <el-aside width="350px">
                      <el-card class="box-card" shadow="always" style="overflow: clip">
                        <div class="hvr-box-shadow-outset">
                          <el-image :src="props.row.coverPic" style=" width: 300px;height: 300px;">

                          </el-image>
                          <div style="padding: 14px">
                            <h4>{{ props.row.bookName }}</h4>
                            <el-icon>
                              <CollectionTag/>
                            </el-icon>
                            press by: {{ props.row.press }}
                            <el-button text class="button hvr-bounce-to-right" type="primary"
                                       @click="goDetail(props.row)">详情页
                            </el-button>
                          </div>
                        </div>
                      </el-card>
                    </el-aside>
                    <el-main>
                      <div class="hvr-backward">
                        <h4><span style="color: cornflowerblue">
                       图书简介
                      </span></h4>
                        <span>
                          Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquid culpa dolore earum esse et eum
                      expedita, fugit iste laudantium libero molestias optio reiciendis veniam voluptate! Eos ex
                      provident saepe?Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad cum id modi, molestiae nostrum rerum soluta. Corporis, dicta eveniet fugiat magnam maxime minima nam nesciunt porro, quas reprehenderit ullam!
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio dolores eius enim est, excepturi exercitationem explicabo illo inventore ipsa labore laboriosam magnam neque quas qui, quisquam reiciendis repellat similique voluptas.
                      lorem  Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquid culpa dolore earum esse et eum
                      lorem
                      </span>
                      </div>
                      <div style="height: 300px">
                        <el-row :gutter="20">
                          <el-col :span="9">
                            <el-row :gutter="20">
                              <div class="hvr-grow-shadow">
                                <el-col :span="24">
                                  <h4><span style="color: #1575d7"> Tags</span></h4>
                                  <el-card shadow="always">
                                    <el-tag
                                        class="mx-1"
                                        closable
                                        :disable-transitions="false"
                                    >
                                      {{ "传统" }}
                                    </el-tag>
                                    <el-tag
                                        class="mx-1"
                                        closable
                                        :disable-transitions="false"
                                    >
                                      {{ "大多数选择" }}
                                    </el-tag>
                                    <el-tag
                                        class="mx-1"
                                        closable
                                        :disable-transitions="false"
                                    >
                                      {{ "小说" }}
                                    </el-tag>
                                  </el-card>
                                </el-col>
                              </div>
                            </el-row>
                            <hr>
                            <el-row :gutter="20">
                              <el-col :span="24">
                                <div class="hvr-grow-shadow" style="width: 263px">
                                  <span style="color: #fd7f00"><h4> 打个分吧!</h4></span>
                                  <el-card shadow="always">
                                    <el-popover
                                        placement="top-start"
                                        title="感谢你的反馈！"
                                        :width="200"
                                        trigger="click"
                                        content="或许你还可以留下你的评论！"
                                    >
                                      <template #reference>
                                        <el-rate v-model="score" :colors="scoreColors"/>
                                      </template>
                                    </el-popover>

                                  </el-card>
                                </div>
                              </el-col>
                            </el-row>
                          </el-col>
                          <el-col :span="15">
                            <div class="hvr-grow-shadow" style="height: 250px">
                              <h4><span style="color: #cc0058">Comments</span></h4>
                              <el-card shadow="always">
                                <el-table :data="comments" style="width: 100%">
                                  <el-table-column label="用户" width="180">
                                    <template #default="scope">
                                      <div style="display: flex; align-items: center">
                                        <el-icon>
                                          <ChatLineRound/>
                                        </el-icon>
                                        <span style="margin-left: 10px">{{ scope.row.name }}</span>
                                      </div>
                                    </template>
                                  </el-table-column>
                                  <el-table-column label="Comments" width="180">
                                    <template #default="scope">
                                      <div>{{ scope.row.comment }}</div>
                                    </template>
                                  </el-table-column>
                                </el-table>
                              </el-card>
                            </div>
                          </el-col>
                        </el-row>
                      </div>
                    </el-main>
                  </el-container>
                </transition>
              </template>
            </el-table-column>
            <!--表格属性-->
            <el-table-column :show-overflow-tooltip="true" label="书号" prop="bookId" sortable/>
            <el-table-column :show-overflow-tooltip="true" label="书名" prop="bookName" sortable/>
            <el-table-column :show-overflow-tooltip="true" label="作者" prop="author" sortable/>
            <el-table-column :show-overflow-tooltip="true" label="价格" prop="price" sortable/>
            <el-table-column :show-overflow-tooltip="true" label="库存" prop="number" sortable/>
            <el-table-column :show-overflow-tooltip="true" label="出版社" prop="press" sortable/>
            <el-table-column :show-overflow-tooltip="true" label="借阅数" prop="readingNumber" sortable/>

            <el-table-column fixed="right" label="借阅" width="120" >
              <template #default="scope">
                <el-button link type="primary" @click="borrowBook(scope.row);" v-show="$store.state.isLogin"
                >借阅
                </el-button
                >
                <el-button link type="primary" @click="returnBook(scope.row)" v-show="$store.state.isLogin"
                >还书
                </el-button
                >
              </template>
            </el-table-column>
          </el-table>
          <el-drawer
              v-model="isOpenFilter"
              title="筛选书籍"
              direction="rtl"
              size="35%"
          >
            <el-descriptions
                class="margin-top"
                title="筛选"
                :column="3"
                border
            >
              <el-descriptions-item>
                <template #label>
                  <div class="cell-item">
                    属性名
                  </div>
                </template>
                {{ filters.price.name }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template #label>
                  <div class="cell-item">
                    最小
                  </div>
                </template>
                <el-input v-model="filters.price.lowest" type="number"></el-input>
              </el-descriptions-item>
              <el-descriptions-item>
                <template #label>
                  <div class="cell-item">
                    最大
                  </div>
                </template>
                <el-input v-model="filters.price.highest" type="number"></el-input>
              </el-descriptions-item>
              <el-descriptions-item>
                <template #label>
                  <div class="cell-item">
                    属性名
                  </div>
                </template>
                {{ filters.borrowNumber.name }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template #label>
                  <div class="cell-item">
                    最小
                  </div>
                </template>
                <el-input v-model="filters.borrowNumber.lowest" type="number"></el-input>
              </el-descriptions-item>
              <el-descriptions-item>
                <template #label>
                  <div class="cell-item">
                    最大
                  </div>
                </template>
                <el-input v-model="filters.borrowNumber.highest" type="number"></el-input>
              </el-descriptions-item>
              <el-descriptions-item>
                <template #label>
                  <div class="cell-item">
                    属性名
                  </div>
                </template>
                {{ filters.bookNumber.name }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template #label>
                  <div class="cell-item">
                    最小
                  </div>
                </template>
                <el-input v-model="filters.bookNumber.lowest" type="number"></el-input>
              </el-descriptions-item>
              <el-descriptions-item>
                <template #label>
                  <div class="cell-item">
                    最大
                  </div>
                </template>
                <el-input v-model="filters.bookNumber.highest" type="number"></el-input>
              </el-descriptions-item>

            </el-descriptions>
          </el-drawer>

          <el-dialog
              v-model="returnDialogVisible"
              title="请输入还书码"
              width="30%"
          >
            <span>还书码</span>
            <el-input v-model="returnInfo.returnCode"></el-input>
            <template #footer>
              <span class="dialog-footer">
                <el-button @click="returnDialogVisible = false">取消</el-button>
                <el-button type="primary" @click="handleReturnDialogConfirm">
                  确定
                </el-button>
              </span>
            </template>
          </el-dialog>
          <el-dialog
              v-model="borrowDialogVisible"
              title="借书信息 "
              width="30%"
          >
            <span>借书码</span>
            <p></p>
            <el-input v-model="borrowInfo.borrowCode"></el-input>
            <p></p>
            <p>归还日期</p>
            <el-date-picker
                v-model="borrowInfo.returnDate"
                type="datetime"
                placeholder="Pick a Date"
                value-format="YYYY-MM-DD hh:mm:ss"
            />
            <template #footer>
              <span class="dialog-footer">
                <el-button @click="borrowDialogVisible = false">取消</el-button>
                <el-button type="primary" @click="handleBorrowDialogConfirm">
                  确定
                </el-button>
              </span>
            </template>
          </el-dialog>
        </el-main>

        <el-footer>
          <el-pagination
              v-loading="isLoading"
              @size-change="sizeChangeHandle"
              @current-change="currentChangeHandle"
              v-model:currentPage="pageIndex"
              v-model:page-size="pageSize"
              :page-sizes="[20,40, 80, 120, 200]"
              :background="true"
              layout="total, sizes, prev, pager, next, jumper"
              :total="totalPage"
          />
        </el-footer>
      </el-container>

    </div>
  </transition>
</template>

<script>
import {Search} from '@element-plus/icons-vue'
import axios from "axios";

let propMap = new Map()
const bookName = "书名"
const bookId = "书号"
const author = "作者"
const press = "出版社"
const number = "库存"
const readingNumber = "借阅数"
const price = "价格"
const props = [bookName, bookId, author, press, number, readingNumber, price]

propMap.set(bookName, "book_name")
propMap.set(bookId, "book_id")
propMap.set(author, "author")
propMap.set(press, "press")
propMap.set(number, "number")
propMap.set(readingNumber, "reading_number")
propMap.set(price, "price")
export default {
  name: "BookListPage",
  data() {
    return {
      isLoading: true,
      icon: {
        Search
      },
      pageIndex: 1,
      pageSize: 10,
      totalPage: 0,
      dataList: [],
      score: 0,
      scoreColors: ['#99A9BF', '#f68402', '#ff0026'],
      comments: [],
      isOpenFilter: false,
      isOpenSearch: false,
      filters: {
        price: {
          name: '价格',
          lowest: 0,
          highest: Number.MAX_VALUE,
        },
        number: {
          name: '库存',
          lowest: 0,
          highest: Number.MAX_VALUE,
        },
        bookId: {
          name: '书号',
        },
        bookName: {
          name: '书名',
        },
        author: {
          name: '作者',
        },
        press: {
          name: '出版社',
        },
        readingNumber: {
          name: '借阅数',
          lowest: 0,
          highest: Number.MAX_VALUE,
        },
      },
      keyWord: '',
      keyProp: '书名',
      props,
      returnDialogVisible: false,
      borrowDialogVisible: false,
      returnInfo: {
        returnCode: "",
        bookId: '',
      },
      borrowInfo: {
        borrowCode: "",
        bookId: '',
        returnDate: '',
        number: 0
      }
    }

  },
  computed: {},
  methods: {
    returnBook(row) {
      this.returnDialogVisible = true
      this.returnInfo.bookId = row.bookId
    },
    handleReturnDialogConfirm() {
      this.returnDialogVisible = false
      this.handleReturn()
    },
    borrowBook(row) {
      this.borrowDialogVisible = true
      this.borrowInfo.bookId = row.bookId
      this.borrowInfo.number = row.number
    },
    handleBorrowDialogConfirm() {
      this.borrowDialogVisible = false

      if (Date.parse(this.borrowInfo.returnDate) < Date.parse(this.$currentDateTime)) {
        this.$errorPopUp("还书时间错误", "失败")
        return
      }
      this.handleBorrow()
    },
    sizeChangeHandle(val) {
      this.pageSize = val
      this.currentPage = 1
      this.getDataList()
    },
    // 当前页
    currentChangeHandle(val) {
      this.currentPage = val
      this.getDataList()
    },
    openFilter() {
      this.isOpenFilter = true
    },
    openSearch() {
      this.isOpenSearch = true
    },

    closeSearch() {
      this.isOpenSearch = false
    },
    reset() {
      this.$successPopUp('已重置筛选项！', '重置')
      this.filters = {
        price: {
          name: '价格',
          lowest: 0,
          highest: Number.MAX_VALUE,
        },
        bookNumber: {
          name: '库存',
          lowest: 0,
          highest: Number.MAX_VALUE,
        },
        borrowNumber: {
          name: '借阅数',
          lowest: 0,
          highest: Number.MAX_VALUE,
        },
      }
    },
    handleBorrow() {
      if (this.borrowInfo.number <= 0) {
        this.$errorPopUp("没有库存", "无法借出")
        return
      }
      let borrowTime = this.$currentDateTime()

      let returnTime
      if (this.borrowInfo.returnDate && this.borrowInfo.returnDate !== "") {
        returnTime = this.borrowInfo.returnDate
      } else {
        returnTime = this.$returnDateTime(borrowTime)
      }
      let borrowRecord = {
        bookId: this.borrowInfo.bookId,
        userId: this.$store.state.user.userId,
        borrowTime,
        returnTime
      }
      axios.post('/api/borrowrecord/save', borrowRecord).then(value => {

        if (value.data.code !== 0) {
          this.$errorPopUp(value.data.msg, '借阅失败')
          return
        }
        this.$successPopUp(value.data.msg, '借阅成功')
        this.getDataList()
      }, reason => {
        this.$errorPopUp(reason.data.msg, '借阅失败')
      })

    },
    handleReturn() {
      let bookId = this.returnInfo.bookId
      let userId = this.$store.state.user.userId
      axios.post('/api/borrowrecord/delete', {
        userId,
        bookId,
      }).then(value => {
        if (value.data.code !== 0) {
          this.$errorPopUp(value.data.msg, "归还失败")
          return
        }
        this.$successPopUp(value.data.msg, "归还成功")
        this.getDataList()
      }, reason => {
        this.$errorPopUp("网络异常", '归还失败')
      })

    },
    getDataList() {
      let limit = this.pageSize
      let page = this.pageIndex
      let key = this.keyWord
      let prop = propMap.get(this.keyProp)
      axios.get(`/api/book/list`, {
        params: {
          limit,
          page,
          key,
          prop
        }
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.dataList = data.page.list
          this.totalPage = data.page.totalCount
        } else {
          this.dataList = []
          this.totalPage = 0
        }
        this.isLoading = false
      })
    },
    goDetail(row) {
      this.$router.push({path: "/DetailPage", query: {"bookId": row.bookId}});
    }

  },
  mounted() {
    this.getDataList()
    this.icon.Search = Search
  }

}
</script>

<style scoped>
.mButton {
  width: 100px;
  height: 60px;
  border-radius: 0;
  background-color: #545c64;
  color: #ffd04b;
}

</style>
