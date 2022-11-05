package com.example.lmsadmin.service.impl;

import common.utils.PageUtils;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.example.lmsadmin.dao.BorrowRecordDao;
import com.example.lmsadmin.entity.BorrowRecordEntity;
import com.example.lmsadmin.service.BorrowRecordService;
import common.utils.Query;


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