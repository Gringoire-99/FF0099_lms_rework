<template>
  <el-row :gutter="20">
    <el-col :span="12">
      <transition
          appear
          enter-active-class="animate__bounceIn"
          name="animate__animated"
      >
        <el-container
        >
          <el-header class="hvr-fade">
            <h4>我的信息</h4>
          </el-header>
          <div class="hvr-border-fade">
            <el-main v-loading="isLoadingUser">

              <el-form>
                <el-form-item label="头像">
                  <el-avatar :size="20" :src="user.avatarPic"/>
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
                  <el-tag class="ml-2" type="warning">{{ user.balance }}</el-tag>
                </el-form-item>
                <el-form-item label="借阅数">
                  <el-tag class="ml-2">{{ user.borrowNumber }}</el-tag>
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
            <el-main v-loading="isLoadingRecords" class="hvr-border-fade">
              <el-collapse>
                <el-collapse-item name="1" title="借阅记录">
                  <el-table :data="records" :border="true" :stripe="true"
                            :row-style="rowState"
                            @row-dblclick="goDetail"
                  >
                    <el-table-column :show-overflow-tooltip="true" label="书号" prop="bookId"></el-table-column>
                    <el-table-column :show-overflow-tooltip="true" label="借阅时间" prop="borrowTime"></el-table-column>
                    <el-table-column :show-overflow-tooltip="true" label="还书时间" prop="returnTime"></el-table-column>
                    <el-table-column type="expand">
                      <template #default="props">
                        <el-descriptions :column="3" border>
                          <el-descriptions-item
                              align="center"
                              class-name="my-content"
                              label="书名"
                              label-align="right"
                              label-class-name="my-label"
                          >{{ books[props.$index].bookName }}
                          </el-descriptions-item
                          >
                          <el-descriptions-item align="center" label="图书编号" label-align="right"
                          >{{ books[props.$index].bookId }}
                          </el-descriptions-item
                          >
                          <el-descriptions-item align="center" label="作者" label-align="right"
                          >{{ books[props.$index].author }}
                          </el-descriptions-item
                          >
                          <el-descriptions-item align="center" label="还书时间" label-align="right">
                            <el-tag size="small">{{ props.row.returnTime }}</el-tag>
                          </el-descriptions-item>
                          <el-descriptions-item align="center" label="摘要" label-align="right"
                          >{{ books[props.$index].summary }}
                          </el-descriptions-item
                          >
                          <el-descriptions-item align="center" label="出版社" label-align="right"
                          >{{ books[props.$index].press }}
                          </el-descriptions-item
                          >
                        </el-descriptions>
                      </template>

                    </el-table-column>
                  </el-table>
                  <el-pagination
                      :small="true"
                      @size-change="sizeChangeHandle"
                      @current-change="currentChangeHandle"
                      v-model:currentPage="pageIndex"
                      v-model:page-size="pageSize"
                      :page-sizes="[5,10,20,40]"
                      :background="true"
                      layout="total, sizes, prev, pager, next, jumper"
                      :total="totalPage"
                  />
                </el-collapse-item>
                <el-collapse-item name="2" title="收藏图书" v-loading="isLoadingFavorites">
                  <el-table :data="books_favorite" :border="true" :stripe="true"
                              @row-dblclick="goDetail"
                >
                  <el-table-column :show-overflow-tooltip="true" label="书号" prop="bookId"></el-table-column>
                  <el-table-column :show-overflow-tooltip="true" label="书名" prop="bookName"></el-table-column>
                  <el-table-column :show-overflow-tooltip="true" label="阅读数" prop="readingNumber"></el-table-column>
                  <el-table-column :show-overflow-tooltip="true" label="出版社" prop="press"></el-table-column>
                  <el-table-column :show-overflow-tooltip="true" label="点赞数" prop="likes"></el-table-column>
                  <el-table-column :show-overflow-tooltip="true" label="收藏数" prop="stars"></el-table-column>
                  <el-table-column :show-overflow-tooltip="true" label="字数统计" prop="wordCount"></el-table-column>
                </el-table>
                  <el-pagination
                      :small="true"
                      @size-change="sizeChangeHandle_favorites"
                      @current-change="currentChangeHandle_favorites"
                      v-model:currentPage="pageIndex_favorites"
                      v-model:page-size="pageSize_favorites"
                      :page-sizes="[5,10,20,40]"
                      :background="true"
                      layout="total, sizes, prev, pager, next, jumper"
                      :total="totalPage_favorites"
                  />
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
    <el-backtop :bottom="100">
      <div
          style="
        height: 100%;
        width: 100%;
        background-color: var(--el-bg-color-overlay);
        box-shadow: var(--el-box-shadow-lighter);
        text-align: center;
        line-height: 40px;
        color: #1989fa;
      "
      >
        UP
      </div>
    </el-backtop>
  </el-row>


</template>
<script>
import {ElNotification} from 'element-plus'
import axios from "axios";

const checkData = function (user) {
  if (!/^[\u4E00-\u9FA5A-Za-z\d_ ]+$/.test(user.userName)) {
    return '姓名为空或包含非法字符'
  }
  if (!/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.(com|cn|net)$/.test(user.email) && user.email !== '未填写') {
    return '请输入合法邮箱'
  }
  if (!/^1[34578][0-9]{9}$/.test(user.phoneNumber)) {
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
        email: '',
        avatarPic: '',
        balance: 0,
        phoneNumber: '',
        borrowNumber: 0
      },
      records: [],
      books: [],
      books_favorite: [],
      readingBook: {
        bookAuthor: '',
        bookId: '',
        bookName: '',
        bookPrice: '',
        borrowNum: '',
        press: '',
        remark: '',
      },
      returnDate: '',
      isLoadingUser: true,
      isLoadingRecords: true,
      pageIndex: 1,
      pageSize: 5,
      totalPage: 0,
      isLoadingFavorites: true,
      pageIndex_favorites: 1,
      pageSize_favorites: 5,
      totalPage_favorites: 0,
      favorites:[]
    }

  },

  computed: {},
  methods: {
    sizeChangeHandle(val) {
      this.pageSize = val
      this.currentPage = 1
      this.getRecords()
    },
    // 当前页
    currentChangeHandle(val) {
      this.currentPage = val
      this.getRecords()
    },
    sizeChangeHandle_favorites(val) {
      this.pageSize = val
      this.currentPage = 1
      this.getRecords()
    },
    // 当前页
    currentChangeHandle_favorites(val) {
      this.currentPage = val
      this.getRecords()
    },
    updateUser() {
      let updateMsg = ''
      let user = this.user
      updateMsg = checkData(user)
      if (updateMsg !== 'correct') {
        this.$warningPopUp(updateMsg, '输入有误')
        return
      }

      axios.post('/api/user/update', user
      ).then(() => {
        this.$successPopUp('数据已递交', '修改成功')

      }, () => {
        this.$errorPopUp('网络未响应', '修改失败')
      })
    },
    getUserData() {
      this.isLoadingUser = true
      if (this.$store.state.isLogin) {
        //挂载时申请用户的详细数据
        let userId = localStorage.getItem("userId")
        axios.get(`/api/user/info/${userId}`).then(value => {
          if (value.data.code !== 0) {
            this.$errorPopUp('获取时发生错误', '获取信息失败')
            return
          }
          if (value.data.user !== null) {
            this.user = value.data.user;
            this.isLoadingUser = false

          }
        }, reason => {
          this.$errorPopUp(reason.code, '服务器未响应')
        })
      }
    },
    getRecords() {
      this.isLoadingRecords = true
      let limit = this.pageSize
      let page = this.pageIndex
      if (this.$store.state.isLogin) {
        //挂载时获取用户的借书记录
        let userId = localStorage.getItem("userId")
        axios.get(`/api/borrowrecord/getRecords`, {
          params: {
            limit,
            page,
            userId
          }
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.records = data.page.list
            this.getBooks(data.page.list)
            this.totalPage = data.page.totalCount
            this.isLoadingRecords = false
          } else {
            this.$errorPopUp('获取时发生错误', '获取信息失败')
            this.records = []
            this.totalPage = 0
          }
        }, reason => {
          this.$errorPopUp(reason.code, '服务器未响应')
        })
      }
    },
    getBooks(records) {
      axios.post(`/api/book/getBooksByRecord`,
          records
      ).then(({data}) => {
        if (data && data.code === 0) {
          this.books = data.list
          this.isLoadingRecords = false
        } else {
          this.books = []
          this.$errorPopUp('获取时发生错误', '获取信息失败')
        }
      }, reason => {
        this.$errorPopUp(reason.code, '服务器未响应')
      })
    },
    rowState({row}) {
      let twoDayTS = Date.parse(new Date("1970-01-03 00:00:00").toString())
      let now = Date.parse(new Date(this.$currentDateTime()).toString())
      let returnTime = Date.parse(new Date(row.returnTime).toString())
      if (returnTime < now) {
        return 'color:red'
      } else if (now + twoDayTS >= returnTime) {
        return 'color:#f47920'
      }
      return '';
    },
    goDetail(row){
      this.$router.push({path: "/DetailPage", query: {"bookId": row.bookId}});
    },
    getFavorites(){
      this.isLoadingFavorites=true
      axios.get("/api/favorites/list",{
        params:{
          userId:this.user.userId,
          page:this.pageIndex_favorites,
          limit:this.pageSize_favorites
        }
      }).then(({data})=>{
        if (data.code!==0){
          this.$errorPopUp(data.msg,"收藏数据获取失败")
          this.totalPage_favorites = 0
          this.favorites = []
          return
        }
        this.isLoadingFavorites=false
        this.favorites= data.page.list
        this.totalPage_favorites = data.page.totalPage
        this.getFavoriteBooks(this.favorites)
      },reason => {
        this.$errorPopUp(reason.msg,"收藏数据获取失败")
        this.totalPage_favorites = 0
        this.favorites = []
      })
    },
    getFavoriteBooks(favorites){
      axios.post(`/api/book/getBooksByFavorites`,
          favorites
      ).then(({data}) => {
        if (data && data.code === 0) {
          this.books_favorite = data.list
          this.isLoadingFavorites = false
        } else {
          this.books_favorite = []
          this.$errorPopUp('获取时发生错误', '获取信息失败')
        }
      }, reason => {
        this.$errorPopUp(reason.code, '服务器未响应')
      })
    }

  },
  mounted() {

  },
  activated() {
    if (!this.$store.state.isLogin){
      this.$warningPopUp('功能不可用','请登录')
    }
    this.getRecords()
    this.getUserData()
    this.getFavorites()
  }

}
</script>

<style>

</style>
