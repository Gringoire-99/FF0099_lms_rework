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
            <el-menu-item index="2" @mouseenter="openSearch">搜索</el-menu-item>
            <el-menu-item index="4" @click="openAdd">添加</el-menu-item>
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
            <!--表格属性-->
            <el-table-column label="借阅书籍Id" prop="borrowBookId" sortable/>
            <el-table-column label="借阅者Id" prop="borrowUserId" sortable/>
            <el-table-column label="借阅时间" prop="borrowDate" sortable/>
            <el-table-column label="归还时间" prop="returnDate" sortable/>
            <el-table-column fixed="right" label="操作" width="120">
              <template #default="scope">
                <el-button link type="primary" @click="handleModify(scope.$index, scope.row);openModify()"
                >修改
                </el-button
                >
                <el-button link type="primary" @click="handelDelete(scope.$index, scope.row);"
                >删除
                </el-button
                >

              </template>
            </el-table-column>
          </el-table>
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
                    :column="2"
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
                    :column="2"
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
                    :column="2"
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
                    title="确定要添加借阅信息吗？"
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
import {ElMessage, ElMessageBox, ElNotification} from "element-plus";
import axios from "axios";

let propMap = new Map()
propMap.set("图书Id", "borrowBookId")
propMap.set("用户Id", "borrowUserId")
propMap.set("还书时间", "returnDate")
propMap.set("借书时间", "borrowDate")
let checkData = function (data) {
  //数值性数据验证
  if ((!/^\d+$/.test("" + data.bookId.newVal)) ||(!/^\d+$/.test("" + data.userId.newVal)) ) {
    return "含有错误数据"
  }
  //字符串性数据验证
  let checkDate = /(((\d{3}[1-9]|\d{2}[1-9]\d{1}|\d{1}[1-9]\d{2}|[1-9]\d{3})-(((0[13578]|1[02])-(0[1-9]|[12]\d|3[01]))|((0[469]|11)-(0[1-9]|[12]\d|30))|(02-(0[1-9]|1\d|2[0-8]))))|(((\d{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29))/

  if ((!checkDate.test(data.borrowDate.newVal)) || (!checkDate.test(data.returnDate.newVal))) {
    return "日期格式错误"
  }
  return "correct"
}

export default {
  name: "BookRecordPage",
  data() {
    return {
      currentPage: 1,
      pageSize: 200,

      isOpenFilter: false,
      isOpenSearch: false,
      isOpenModify: false,
      isOpenAdd: false,

      filters: {
        userId: {
          name: '用户Id',
        },
        bookId: {
          name: '图书Id',
        },
        borrowDate: {
          name: '借书时间'
        },
        returnDate: {
          name: '还书时间'
        },

      },
      keyWord: '',
      keyProp: '用户Id',

      modify: {
        userId: {
          name: '用户Id',
          oldVal: '',
          newVal: '',
        },
        bookId: {
          name: '图书Id',
          oldVal: '',
          newVal: '',
        },
        borrowDate: {
          name: '借书时间',
          oldVal: '',
          newVal: '',
        },
        returnDate: {
          name: '还书时间',
          oldVal: '',
          newVal: '',
        },
      },
      add: {
        userId: {
          name: '用户Id',
          newVal: '',
        },
        bookId: {
          name: '图书Id',
          newVal: '',
        },
        borrowDate: {
          name: '借书时间',
          newVal: '',
        },
        returnDate: {
          name: '还书时间',
          newVal: '',
        },
      },
    }
  }, computed: {
    filterList() {
      let bookRecord = this.$store.state.bookRecord
      let keyProp = propMap.get(this.keyProp)
      let keyWord = this.keyWord

      let fl = bookRecord.filter((record) => ("" + record[keyProp]).indexOf(keyWord) !== -1)
      console.log(fl)


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
    },handleModify(index, row) {
      this.modify.bookId.oldVal = this.modify.bookId.newVal = row.borrowBookId
      this.modify.userId.oldVal = this.modify.userId.newVal = row.borrowUserId
      this.modify.returnDate.oldVal = this.modify.returnDate.newVal = row.returnDate
      this.modify.borrowDate.oldVal = this.modify.borrowDate.newVal = row.borrowDate
    },
    submitModify() {
      //检验数据完整性
      let msg = checkData(this.modify)

      //判断检查信息，发送弹窗
      if (msg !== "correct") {
        this.warningPopUp(msg, "修改失败")
        return
      }
      let record = {
        borrowBookId: this.modify.bookId.newVal,
        borrowUserId: this.modify.userId.newVal,
        returnDate: this.modify.returnDate.newVal,
        borrowDate: this.modify.borrowDate.newVal,
      }

      new Promise((resolve, reject) => {
        //应该使用put
        axios.post('/api/updateRecord', record).then(value => {
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
    request() {
      new Promise(() => {
        axios.get('/api/getAllRecord').then(value => {
          this.$store.commit('UPDATE_BOOK_RECORD', value.data.data)
        }, () => {
          this.errorPopUp('数据请求失败', '网络异常')
        })
      })
    },
    submitAdd() {
      //检验数据完整性
      let msg = checkData(this.add)
      //判断检查信息，发送弹窗
      if (msg !== "correct") {
        this.warningPopUp(msg, "修改失败")
        return
      }
      let record = {
        borrowBookId: this.add.bookId.newVal,
        borrowUserId: this.add.userId.newVal,
        returnDate: this.add.returnDate.newVal,
        borrowDate: this.add.borrowDate.newVal,
      }
      new Promise((resolve, reject) => {
        //应该使用put
        axios.post('/api/borrowBook', record).then(value => {
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
        this.errorPopUp('数据添加时出现异常（该记录可能已存在！）', '添加失败')
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
          axios.delete('/api/deleteRecord', {
            params: {
              borrowBookId: row.borrowBookId,
              borrowUserId: row.borrowUserId,
              borrowDate: row.borrowDate+'',
              returnDate: row.returnDate+''
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

  },

}
</script>

<style scoped>

</style>