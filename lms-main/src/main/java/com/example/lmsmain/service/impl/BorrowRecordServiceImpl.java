package com.example.lmsmain.service.impl;

import common.utils.PageUtils;
import common.utils.Query;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.example.lmsmain.dao.BorrowRecordDao;
import com.example.lmsmain.entity.BorrowRecordEntity;
import com.example.lmsmain.service.BorrowRecordService;


@Service("borrowRecordService")
public class BorrowRecordServiceImpl extends ServiceImpl<BorrowRecordDao, BorrowRecordEntity> implements BorrowRecordService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<BorrowRecordEntity> page = this.page(
                new Query<BorrowRecordEntity>().getPage(params),
                new QueryWrapper<BorrowRecordEntity>()
        );

        return new PageUtils(page);
    }

}