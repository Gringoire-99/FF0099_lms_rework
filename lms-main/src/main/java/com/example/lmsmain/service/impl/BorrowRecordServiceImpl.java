package com.example.lmsmain.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.lmsmain.dao.BorrowRecordDao;
import com.example.lmsmain.entity.BorrowRecordEntity;
import com.example.lmsmain.service.BorrowRecordService;
import common.utils.PageUtils;
import common.utils.Query;
import org.springframework.stereotype.Service;

import java.util.Map;


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

    @Override
    public boolean deleteRecord(BorrowRecordEntity borrowRecord) {
        LambdaQueryWrapper<BorrowRecordEntity> lqw = new LambdaQueryWrapper<>();
        lqw.eq(BorrowRecordEntity::getUserId, borrowRecord.getUserId());
        lqw.eq(BorrowRecordEntity::getBookId, borrowRecord.getBookId());
        return this.remove(lqw);
    }

    @Override
    public BorrowRecordEntity getByIds(String userId, String bookId) {
        LambdaQueryWrapper<BorrowRecordEntity> lqw = new LambdaQueryWrapper<>();
        lqw.eq(BorrowRecordEntity::getUserId, userId)
                .eq(BorrowRecordEntity::getBookId, bookId);
        return this.getOne(lqw);
    }

    @Override
    public PageUtils getRecordsById(Map<String,Object> params) {
        String userId = (String) params.get("userId");
        LambdaQueryWrapper<BorrowRecordEntity> lqw = new LambdaQueryWrapper<>();
        lqw.eq(userId!=null,BorrowRecordEntity::getUserId,userId);
        IPage<BorrowRecordEntity> page = this.page(
                new Query<BorrowRecordEntity>().getPage(params),
                lqw);
        return new PageUtils(page);
    }

}