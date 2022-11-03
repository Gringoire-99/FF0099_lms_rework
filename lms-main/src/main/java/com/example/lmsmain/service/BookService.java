package com.example.lmsmain.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.lmsmain.entity.BookEntity;
import com.example.lmsmain.entity.BorrowRecordEntity;
import common.utils.PageUtils;

import java.util.List;
import java.util.Map;

/**
 * 图书表
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-31 12:39:08
 */
public interface BookService extends IService<BookEntity> {

    PageUtils queryPage(Map<String, Object> params);
     void updateByRecord(BorrowRecordEntity borrowRecord,Integer number);

    List<BookEntity> getBooksByRecord(List<BorrowRecordEntity> records);
}

