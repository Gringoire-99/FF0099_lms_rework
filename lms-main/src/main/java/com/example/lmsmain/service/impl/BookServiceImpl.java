package com.example.lmsmain.service.impl;

import common.utils.PageUtils;
import common.utils.Query;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.example.lmsmain.dao.BookDao;
import com.example.lmsmain.entity.BookEntity;
import com.example.lmsmain.service.BookService;


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