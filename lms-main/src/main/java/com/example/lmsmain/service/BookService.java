package com.example.lmsmain.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.lmsmain.entity.BookEntity;
import common.utils.PageUtils;

import java.util.Map;

/**
 * 图书表
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-24 16:13:48
 */
public interface BookService extends IService<BookEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

