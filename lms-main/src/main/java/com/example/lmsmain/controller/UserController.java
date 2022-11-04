package com.example.lmsmain.controller;

import com.example.lmsmain.entity.UserEntity;
import com.example.lmsmain.service.UserService;
import common.utils.PageUtils;
import common.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


/**
 * 用户
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-31 12:39:08
 */
@RestController
@RequestMapping("lmsmain/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public R login(@RequestParam Map<String, Object> params) {
        UserEntity user = userService.doLogin(params);
        if (user != null) {
            user.setPassword(null);
            return R.ok().put("user", user);
        }
        return R.error("登录失败");
    }

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = userService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{userId}")
    public R info(@PathVariable("userId") String userId) {
        UserEntity user = userService.getById(userId);
        if (user==null){
            return R.error("登陆失败");
        }
        user.setPassword(null);
        return R.ok().put("user", user);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody UserEntity user) {
        try {
            userService.save(user);

            return R.ok();
        } catch (Exception e) {
            return R.error("已注册");
        }
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody UserEntity user) {
        userService.updateById(user);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody String[] userIds) {
        userService.removeByIds(Arrays.asList(userIds));

        return R.ok();
    }

}
