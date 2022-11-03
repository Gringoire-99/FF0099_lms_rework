package com.example.lmsmain.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.lmsmain.dao.BookDao;
import com.example.lmsmain.entity.BookEntity;
import com.example.lmsmain.entity.BorrowRecordEntity;
import com.example.lmsmain.service.BookService;
import common.utils.Constant;
import common.utils.PageUtils;
import common.utils.Query;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Service("bookService")
public class BookServiceImpl extends ServiceImpl<BookDao, BookEntity> implements BookService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        //1、获取key
        String key = (String) params.get(Constant.KEY_WORD);
        String prop = (String) params.get(Constant.PROPERTY);
        QueryWrapper<BookEntity> lqw = new QueryWrapper<>();
            lqw.like(!(StringUtils.isEmpty(key)||StringUtils.isEmpty(prop)),prop,key);

        IPage<BookEntity> page = this.page(
                new Query<BookEntity>().getPage(params),
                lqw
        );

        return new PageUtils(page);
    }

    public void updateByRecord(BorrowRecordEntity borrowRecord, Integer borrowNumber) {
        LambdaQueryWrapper<BookEntity> lqw = new LambdaQueryWrapper<>();
        lqw.eq(BookEntity::getBookId,borrowRecord.getBookId());
        BookEntity book = this.getById(borrowRecord.getBookId());
        book.setNumber(book.getNumber() - borrowNumber);
        book.setReadingNumber(book.getReadingNumber() + borrowNumber);
        this.update(book, lqw);
    }

    @Override
    public List<BookEntity> getBooksByRecord(List<BorrowRecordEntity> records) {
        ArrayList<String> ids = new ArrayList<>();
        if (records.size() == 0)return new ArrayList<>();
        records.forEach((record)->{
            ids.add(record.getBookId());
        });
        return this.getBaseMapper().selectBatchIds(ids);
    }
}