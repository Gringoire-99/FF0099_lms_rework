package com.example.lmsadmin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.lmsadmin.entity.UserEntity;
import common.utils.PageUtils;

import java.util.Map;

/**
 * 用户
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-11-05 19:45:43
 */
public interface UserService extends IService<UserEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

