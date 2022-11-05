package com.example.lmsadmin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.lmsadmin.entity.BookEntity;
import common.utils.PageUtils;

import java.util.Map;

/**
 * 图书表
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-11-05 19:45:43
 */
public interface BookService extends IService<BookEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

