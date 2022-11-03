const moment = require("moment");
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
function returnDate(date){
    let currentTimestamp = Date.parse(new Date(date).toString());
    let weekTimestamp = Date.parse(new Date("1970-01-08 00:00:00").toString())
    return  moment(currentTimestamp+weekTimestamp).format('YYYY-MM-DD HH:mm:ss');
}

console.log(returnDate(getCurrentTime()));
