package com.example.lmsadmin.controller;

import com.example.lmsadmin.entity.AdminEntity;
import com.example.lmsadmin.service.AdminService;
import common.utils.PageUtils;
import common.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


/**
 * 管理员列表
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-11-05 19:45:43
 */
@RestController
@RequestMapping("lmsadmin/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = adminService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{adminId}")
    public R info(@PathVariable("adminId") String adminId) {
        AdminEntity admin = adminService.getById(adminId);

        return R.ok().put("admin", admin);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody AdminEntity admin) {
        adminService.save(admin);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody AdminEntity admin) {
        adminService.updateById(admin);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody String[] adminIds) {
        adminService.removeByIds(Arrays.asList(adminIds));

        return R.ok();
    }

}
