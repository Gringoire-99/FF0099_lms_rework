//声明一个store
import Vuex from 'vuex';

//actions: 可被分配的动作（预处理，申请ajax）
const actions = {

}
//动作调用的实现方法(改变state)
const mutations = {
    //参数1 state 所有组件都可访问到的空间，2 action传递的参数
    UPDATE_BOOK_LIST(state, list) {
        state.bookList=list
    },
    UPDATE_BOOK_RECORD(state, list) {
        state.bookRecord=list
    },

}
const state = {
    bookList: [

    ],
    bookRecord: [

    ],
    //只是用于展示容器 - 待重构
    comments: [
        {name: '009', comment: "很好看，孩子很喜欢"},
        {name: 'cat', comment: "经典"},
        {name: 'fish', comment: "非常喜欢"},
        {name: 'meme', comment: "经典"},
    ],
    user: {
        userName: '',
        userId: '',
        gender: '',
        role: '',
        birthdate: '',
        remark: ''
    },
    isLogin: false
}
export const store = Vuex.createStore({
    state,
    mutations,
    actions,
})