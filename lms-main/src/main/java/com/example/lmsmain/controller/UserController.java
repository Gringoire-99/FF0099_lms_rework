package com.example.lmsmain.controller;

import java.util.Arrays;
import java.util.Map;

import ch.qos.logback.core.status.ErrorStatus;
import common.utils.PageUtils;
import common.utils.R;
import kotlin.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.example.lmsmain.entity.UserEntity;
import com.example.lmsmain.service.UserService;

import javax.servlet.http.HttpServletRequest;


/**
 * 用户
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-24 16:13:48
 */
@RestController
@RequestMapping("lmsmain/user")
public class UserController {
    @Autowired
    private UserService userService;
    /**
     * 登录
     */
    @GetMapping("/login")
    public R login(@RequestParam String phoneNumber, @RequestParam String password) {
        UserEntity user = userService.getUser(phoneNumber, password);
        if (user == null) {
            return R.error().put("msg","登录失败");
        }
        return R.ok().put("user",user);

    }

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = userService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{userId}")
    public R info(@PathVariable("userId") Long userId){
		UserEntity user = userService.getById(userId);

        return R.ok().put("user", user);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody UserEntity user){
		userService.save(user);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody UserEntity user){
		userService.updateById(user);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] userIds){
		userService.removeByIds(Arrays.asList(userIds));

        return R.ok();
    }

}
