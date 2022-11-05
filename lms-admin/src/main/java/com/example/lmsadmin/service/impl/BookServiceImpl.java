package com.example.lmsadmin.service.impl;

import common.utils.PageUtils;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.example.lmsadmin.dao.BookDao;
import com.example.lmsadmin.entity.BookEntity;
import com.example.lmsadmin.service.BookService;

import common.utils.Query;

@Service("bookService")
public class BookServiceImpl extends ServiceImpl<BookDao, BookEntity> implements BookService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<BookEntity> page = this.page(
                new Query<BookEntity>().getPage(params),
                new QueryWrapper<BookEntity>()
        );

        return new PageUtils(page);
    }

}