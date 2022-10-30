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
            <el-menu-item index="3" @click="reset();successPopUp('已重置筛选项！','重置')">重置</el-menu-item>
            <el-menu-item index="4" @click="openAdd" v-show="isAuth">添加</el-menu-item>
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
              ></el-input>
              <el-select class="m-2" placeholder="Select" size="large" v-model="keyProp">
                <el-option
                    v-for="(prop,index) in filters"
                    :key="index"
                    :label="prop.name"
                    :value="prop.name"
                />
              </el-select>

            </div>
          </transition>
          <el-table :data="pageList" style="width: 100%"
                    :stripe="true"
                    :border="true"
                    height="600"
                    max-height="600"
                    :default-sort="{ prop: 'bookId', order: 'descending' }"
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
                          <img
                              src="https://img.alicdn.com/imgextra/i1/2718889079/O1CN0197JYoj2GwEPkQLEcW_!!0-item_pic.jpg_430x430q90.jpg"
                              class="image" style=" width: 300px;height: 300px;"
                              alt="error"
                          />
                          <div style="padding: 14px">
                            <h4>{{ props.row.bookName }}</h4>
                            <el-icon>
                              <CollectionTag/>
                            </el-icon>
                            press by: {{ props.row.press }}
                            <el-button text class="button hvr-bounce-to-right" type="primary">详情页</el-button>
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
                              <h4><span style="color: #cc0058">Commands</span></h4>
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
            <el-table-column label="书号" prop="bookId" sortable/>
            <el-table-column label="书名" prop="bookName" sortable/>
            <el-table-column label="作者" prop="bookAuthor" sortable/>
            <el-table-column label="价格" prop="bookPrice" sortable/>
            <el-table-column label="库存" prop="bookNumber" sortable/>
            <el-table-column label="出版社" prop="press" sortable/>
            <el-table-column label="借阅数" prop="borrowNumber" sortable/>
            <el-table-column fixed="right" label="操作" width="120" v-if="isAuth">
              <template #default="scope">
                <el-button link type="primary" @click="handleModify(scope.$index, scope.row);openModify()" v-if="isAuth"

                >修改
                </el-button
                >
                <el-button link type="primary" @click="handelDelete(scope.$index, scope.row);"
                >删除
                </el-button
                >

              </template>
            </el-table-column>
            <el-table-column fixed="right" label="借阅" width="120">
              <template #default="scope">
                <el-button link type="primary" @click="handleBorrow(scope.$index, scope.row);"
                >借阅
                </el-button
                >
                <el-button link type="primary" @click="handleReturn(scope.$index, scope.row);"
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
          <el-drawer
              v-model="isOpenModify"
              direction="rtl"
              size="35%"
          >
            <el-card class="box-card">
              <template #header>
                <div class="card-header">
                  <h4>修改数据</h4>
                </div>
                <p></p>
                <el-descriptions
                    class="margin-top"
                    title="旧数据"
                    :column="3"
                    border
                >
                  <el-descriptions-item v-for="(prop,index) in modify" :key='index'>
                    <template #label>
                      <div class="cell-item">
                        {{ prop.name }}
                      </div>
                    </template>
                    {{ prop.oldVal }}
                  </el-descriptions-item>
                </el-descriptions>
                <p></p>
                <el-descriptions
                    class="margin-top"
                    title="新数据"
                    :column="3"
                    border
                >
                  <el-descriptions-item v-for="(prop,index) in modify" :key='index'>
                    <template #label>
                      <div class="cell-item">
                        {{ prop.name }}
                      </div>
                    </template>
                    <el-input v-model.trim="prop.newVal"></el-input>
                  </el-descriptions-item>
                </el-descriptions>
              </template>
              <div class="bottom">
                <el-popconfirm
                    confirm-button-text="是"
                    cancel-button-text="算了"
                    icon-color="#626AEF"
                    title="确定要修改信息吗？"
                    @confirm="submitModify"
                >
                  <template #reference>
                    <el-button type="primary">保存</el-button>
                  </template>
                </el-popconfirm>
                <el-button @click="closeModify">取消</el-button>
              </div>
            </el-card>
          </el-drawer>
          <el-drawer
              v-model="isOpenAdd"
              direction="rtl"
              size="35%"
          >
            <el-card class="box-card">
              <template #header>
                <div class="card-header">
                  <h4>添加数据</h4>
                </div>
                <p></p>
                <el-descriptions
                    class="margin-top"
                    title="新数据"
                    :column="3"
                    border
                >
                  <el-descriptions-item v-for="(prop,index) in add" :key='index'>
                    <template #label>
                      <div class="cell-item">
                        {{ prop.name }}
                      </div>
                    </template>
                    <el-input v-model.trim="prop.newVal"></el-input>
                  </el-descriptions-item>
                </el-descriptions>
              </template>
              <div class="bottom">
                <el-popconfirm
                    confirm-button-text="是"
                    cancel-button-text="算了"
                    icon-color="#626AEF"
                    title="确定要添加书籍信息吗？"
                    @confirm="submitAdd"
                >
                  <template #reference>
                    <el-button type="primary">添加</el-button>
                  </template>
                </el-popconfirm>
                <el-button @click="closeAdd">取消</el-button>
              </div>
            </el-card>
          </el-drawer>
        </el-main>
        <el-footer>
          <el-pagination
              v-model:currentPage="currentPage"
              v-model:page-size="pageSize"
              :page-sizes="[20,40, 80, 120, 200]"
              :background="true"
              layout="total, sizes, prev, pager, next, jumper"
              :total="total"
          />
        </el-footer>
      </el-container>

    </div>
  </transition>
</template>

<script>
import {Search} from '@element-plus/icons-vue'
import {ElNotification} from 'element-plus'
import axios from "axios";
import {ElMessage, ElMessageBox} from 'element-plus'

let propMap = new Map()
propMap.set("书名", "bookName")
propMap.set("书号", "bookId")
propMap.set("作者", "bookAuthor")
propMap.set("出版社", "press")
propMap.set("库存", "bookNumber")
propMap.set("借阅数", "borrowNumber")
propMap.set("价格", "bookPrice")
let checkData = function (data) {
  //数值性数据验证
  if ((!/^\d+$/.test("" + data.bookId.newVal)) || (!/^\d+$/.test("" + data.bookNumber.newVal)) || (!/^\d+$/.test("" + data.borrowNumber.newVal)) || (!/^\d+$/.test("" + data.bookPrice.newVal))) {
    return "含有错误数据"
  }
  //字符串性数据验证
  if ((!/^[\u4E00-\u9FA5A-Za-z\d_ ]+$/.test(data.press.newVal)) || (!/^[\u4E00-\u9FA5A-Za-z\d_ ]+$/.test(data.press.newVal)) || (!/^[\u4E00-\u9FA5A-Za-z\d_ ]+$/.test(data.bookName.newVal))) {
    return "含有错误数据"
  }
  return "correct"
}

Date.prototype.Format = function (fmt) {
  let o = {
    "M+": this.getMonth() + 1, //月份
    "d+": this.getDate(), //日
    "H+": this.getHours(), //小时
    "m+": this.getMinutes(), //分
    "s+": this.getSeconds(), //秒
    "q+": Math.floor((this.getMonth() + 3) / 3), //季度
    "S": this.getMilliseconds() //毫秒
  };
  if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
  for (let k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
  return fmt;
}
export default {
  name: "BookListPage",
  data() {
    return {
      icon: {
        Search
      },
      currentPage: 1,
      pageSize: 200,

      score: 0,
      scoreColors: ['#99A9BF', '#f68402', '#ff0026'],

      isOpenFilter: false,
      isOpenSearch: false,
      isOpenModify: false,
      isOpenAdd: false,

      filters: {
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
        bookId: {
          name: '书号',
        },
        bookName: {
          name: '书名',
        },
        bookAuthor: {
          name: '作者',
        },
        press: {
          name: '出版社',
        },
        borrowNumber: {
          name: '借阅数',
          lowest: 0,
          highest: Number.MAX_VALUE,
        },
      },
      keyWord: '',
      keyProp: '书名',

      modify: {
        bookPrice: {
          name: '价格',
          oldVal: '',
          newVal: '',
        },
        bookNumber: {
          name: '库存',
          oldVal: '',
          newVal: '',
        },
        bookId: {
          name: '书号',
          oldVal: '',
          newVal: '',
        },
        bookName: {
          name: '书名',
          oldVal: '',
          newVal: '',
        },
        bookAuthor: {
          name: '作者',
          oldVal: '',
          newVal: '',
        },
        press: {
          name: '出版社',
          oldVal: '',
          newVal: '',
        },
        borrowNumber: {
          name: '借阅数',
          oldVal: '',
          newVal: '',
        },
      },
      add: {
        bookPrice: {
          name: '价格',
          newVal: '',
        },
        bookNumber: {
          name: '库存',
          newVal: '',
        },
        bookId: {
          name: '书号',
          newVal: '',
        },
        bookName: {
          name: '书名',
          newVal: '',
        },
        bookAuthor: {
          name: '作者',
          newVal: '',
        },
        press: {
          name: '出版社',
          newVal: '',
        },
        borrowNumber: {
          name: '借阅数',
          newVal: '',
        },
      },
    }
  },
  computed: {
    comments() {
      //可能需要执行Ajax请求
      return this.$store.state.comments
    },
    filterList() {
      let bookList = this.$store.state.bookList
      let keyProp = propMap.get(this.keyProp)
      let keyWord = this.keyWord

      let fl
      fl = bookList.filter((book) => {
        return book.bookPrice >= this.filters.price.lowest && book.bookPrice <= this.filters.price.highest
            && book.bookNumber >= this.filters.bookNumber.lowest && book.bookNumber <= this.filters.bookNumber.highest
            && book.borrowNumber >= this.filters.borrowNumber.lowest && book.borrowNumber <= this.filters.borrowNumber.highest
      });

      fl = fl.filter((book) => ("" + book[keyProp]).indexOf(keyWord) !== -1)


      return fl;
    },
    pageList() {
      let currentPage = this.currentPage
      let pageSize = this.pageSize
      let start = (currentPage - 1) * pageSize
      let end = currentPage * pageSize - 1
      let fl = this.filterList
      fl = fl.slice(start, end)
      return fl
    },
    total() {
      return this.filterList.length
    },
    isAuth() {
      return this.$store.state.user.role === 'admin'
    }
  },
  methods: {
    openFilter() {
      this.isOpenFilter = true
    },
    openSearch() {
      this.isOpenSearch = true
    },
    openModify() {
      this.isOpenModify = true
    },
    openAdd() {
      this.isOpenAdd = true
    },
    closeSearch() {
      this.isOpenSearch = false
    },
    closeModify() {
      this.isOpenModify = false
    },
    closeAdd() {
      this.isOpenAdd = false
    },
    reset() {
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
    warningPopUp(message, title) {
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
    errorPopUp(message, title) {
      ElNotification({
        title,
        message,
        type: 'error',
      })
    },
    handleModify(index, row) {
      this.modify.bookId.oldVal = this.modify.bookId.newVal = row.bookId
      this.modify.bookName.oldVal = this.modify.bookName.newVal = row.bookName
      this.modify.bookAuthor.oldVal = this.modify.bookAuthor.newVal = row.bookAuthor
      this.modify.bookPrice.oldVal = this.modify.bookPrice.newVal = row.bookPrice
      this.modify.press.oldVal = this.modify.press.newVal = row.press
      this.modify.bookNumber.oldVal = this.modify.bookNumber.newVal = row.bookNumber
      this.modify.borrowNumber.oldVal = this.modify.borrowNumber.newVal = row.borrowNumber
    },
    submitModify() {
      //检验数据完整性
      let msg = checkData(this.modify)

      //判断检查信息，发送弹窗
      if (msg !== "correct") {
        this.warningPopUp(msg, "修改失败")
        return
      }
      let book = {
        bookId: this.modify.bookId.newVal,
        bookName: this.modify.bookName.newVal,
        bookPrice: this.modify.bookPrice.newVal,
        bookAuthor: this.modify.bookAuthor.newVal,
        press: this.modify.press.newVal,
        bookNumber: this.modify.bookNumber.newVal,
        borrowNumber: this.modify.borrowNumber.newVal,
        remark: null
      }

      new Promise((resolve, reject) => {
        //应该使用put
        axios.post('/api/updateBook', book).then(value => {
          if (value.data.code != 200) {
            reject()
          }
          resolve()
        }, reason => {
          this.errorPopUp('网络异常', '更新失败')
        })
      }).then(value => {
        this.successPopUp('数据已更新！', '更新成功')
        this.request()
        this.closeModify()
      }, reason => {
        this.errorPopUp('数据更新时出现异常', '更新失败')
      })

      //合法数据将发送给服务器，进行下一步判断

    },
    submitAdd() {
      //检验数据完整性
      let msg = checkData(this.add)
      let book = {
        bookId: this.add.bookId.newVal,
        bookName: this.add.bookName.newVal,
        bookPrice: this.add.bookPrice.newVal,
        bookAuthor: this.add.bookAuthor.newVal,
        press: this.add.press.newVal,
        bookNumber: this.add.bookNumber.newVal,
        borrowNumber: this.add.borrowNumber.newVal,
        remark: null
      }
      //判断检查信息，发送弹窗
      if (msg !== "correct") {
        this.warningPopUp(msg, "修改失败")
        return
      }
      new Promise((resolve, reject) => {
        //应该使用put
        axios.post('/api/addBook', book).then(value => {
          if (value.data.code != 200) {
            reject()
          }
          resolve()
        }, reason => {
          this.errorPopUp('网络异常', '添加失败')
        })
      }).then(value => {
        this.successPopUp('数据已更新！', '添加成功')
        this.request()
        this.closeAdd()
      }, reason => {
        this.errorPopUp('数据添加时出现异常（该书可能已存在！）', '添加失败')
      })
      //合法数据将发送给服务器，进行下一步判断
      this.closeModify()

    },
    handelDelete(index, row) {
      let d = ElMessageBox.confirm(
          '确认要删除此记录（该找不可逆）?',
          '警告',
          {
            confirmButtonText: '是的',
            cancelButtonText: '算了',
            type: 'warning',
          }
      ).then((value) => {
        new Promise((resolve, reject) => {
          axios.delete('/api/deleteBook', {
            params: {
              bookId: row.bookId
            }
          }).then(value => {
            if (value.data.code != 200) {
              reject()
            }
            resolve()
          }, reason => {
            this.errorPopUp("网络异常", '删除失败')
          })
        }).then(value1 => {
          this.successPopUp('数据已更新', '删除成功')
          this.request()
        }, reason => {
          this.errorPopUp('删除失败（可能存在依赖）', '删除失败')
        })
      }, reason => {
        ElMessage({
          type: 'info',
          message: '取消删除',
        })
      })
    },
    request() {
      new Promise(() => {
        axios.get('/api/getAllBooks').then(value => {
          this.$store.commit('UPDATE_BOOK_LIST', value.data.data)
        }, () => {
          this.errorPopUp('数据请求失败', '网络异常')
        })
      })
    },
    handleBorrow(index, row) {
      let d = ElMessageBox.confirm(
          '要借阅这本书吗?',
          '询问',
          {
            confirmButtonText: '是的',
            cancelButtonText: '算了',
            type: 'info',
          }
      ).then((value) => {
        let borrowDate = '2099-6-15'
        let returnDate = '2099-6-20'
        let borrowRecord = {
          borrowBookId: row.bookId,
          borrowUserId: this.$store.state.user.userId,
          borrowDate,
          returnDate
        }
        new Promise((resolve, reject) => {
          axios.post('/api/borrowBook', borrowRecord).then(value => {
            if (value.data.code != 200) {
              reject()
            }
            resolve()
          }, reason => {
            this.errorPopUp("网络异常", '借阅失败')
          })
        }).then(value1 => {
          this.successPopUp('数据已更新', '借阅成功')
          this.request()
        }, reason => {
          this.errorPopUp('借阅失败（可能存在未还的同类书）', '借阅失败')
        })
      }, reason => {
        ElMessage({
          type: 'info',
          message: '取消借阅',
        })
      })
    },
    handleReturn(index, row) {
      //实际需要引入密钥
      let d = ElMessageBox.confirm(
          '要归还这本书吗?',
          '询问',
          {
            confirmButtonText: '是的',
            cancelButtonText: '算了',
            type: 'info',
          }
      ).then((value) => {
        let userId = this.$store.state.user.userId
        let bookId = row.bookId
        new Promise((resolve, reject) => {
          axios.delete('/api/returnBook', {
            params: {
              userId,
              bookId,
            }
          }).then(value => {
            if (value.data.code != 200) {
              reject()
            }
            resolve()
          }, reason => {
            this.errorPopUp("网络异常", '归还失败')
          })
        }).then(value1 => {
          this.successPopUp('数据已更新', '归还成功')
          this.request()
        }, reason => {
          this.errorPopUp('（可能已全部归还）', '归还失败')
        })
      }, reason => {
        ElMessage({
          type: 'info',
          message: '取消还书',
        })
      })
    },

  },
  mounted() {
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