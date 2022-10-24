package com.example.lmsmain.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.lmsmain.entity.AdminEntity;
import common.utils.PageUtils;

import java.util.Map;

/**
 * 管理员列表
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-24 16:13:48
 */
public interface AdminService extends IService<AdminEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

