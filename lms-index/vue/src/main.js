import {createApp} from 'vue'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.min'
import ElementPlus, {ElNotification} from 'element-plus'
import zhCn from 'element-plus/es/locale/lang/zh-cn'
import 'element-plus/dist/index.css'
import {store} from "@/store";
import App from './App.vue'
import Router from "@/router";
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
import moment from "moment/moment";

const app = createApp(App)

for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
}
app.use(ElementPlus, {
    locale: zhCn,
})

function successPopUp(message, title) {
    ElNotification({
        title,
        message,
        type: 'success',
    })
}

function warningPopUp(message, title) {
    ElNotification({
        title,
        message,
        type: 'warning',
    })
}
function errorPopUp(message, title) {
    ElNotification({
        title,
        message,
        type: 'error',
    })
}
function getCurrentTime() {
    let date = new Date();//当前时间
    let month = zeroFill(date.getMonth() + 1);//月
    let day = zeroFill(date.getDate());//日
    let hour = zeroFill(date.getHours());//时
    let minute = zeroFill(date.getMinutes());//分
    let second = zeroFill(date.getSeconds());//秒

    //当前时间
    return date.getFullYear() + "-" + month + "-" + day
        + " " + hour + ":" + minute + ":" + second;
}

/**
 * 补零
 */
function zeroFill(i){
    if (i >= 0 && i <= 9) {
        return "0" + i;
    } else {
        return i;
    }
}
function returnDateTime(date){
    let currentTimestamp = Date.parse(new Date(date).toString());
    let weekTimestamp = Date.parse(new Date("1970-01-08 00:00:00").toString())
    return  moment(currentTimestamp+weekTimestamp).format('YYYY-MM-DD HH:mm:ss');
}
app.config.globalProperties.$successPopUp = successPopUp
app.config.globalProperties.$warningPopUp = warningPopUp
app.config.globalProperties.$errorPopUp = errorPopUp
app.config.globalProperties.$currentDateTime = getCurrentTime
app.config.globalProperties.$returnDateTime = returnDateTime

app.use(store)
app.use(Router)
app.mount('#app')



