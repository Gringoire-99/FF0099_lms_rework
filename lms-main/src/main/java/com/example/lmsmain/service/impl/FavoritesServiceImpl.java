package com.example.lmsmain.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.lmsmain.dao.FavoritesDao;
import com.example.lmsmain.entity.FavoritesEntity;
import com.example.lmsmain.service.FavoritesService;
import common.utils.PageUtils;
import common.utils.Query;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("favoritesService")
public class FavoritesServiceImpl extends ServiceImpl<FavoritesDao, FavoritesEntity> implements FavoritesService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<FavoritesEntity> page = this.page(
                new Query<FavoritesEntity>().getPage(params),
                new QueryWrapper<FavoritesEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public FavoritesEntity getByIds(String bookId, String userId) {
        LambdaQueryWrapper<FavoritesEntity> lqw = new LambdaQueryWrapper<>();
        lqw.eq(FavoritesEntity::getBookId,bookId);
        lqw.eq(FavoritesEntity::getUserId,userId);
        return this.getOne(lqw);
    }

    @Override
    public boolean removeById(String bookId, String userId) {
        LambdaQueryWrapper<FavoritesEntity> lqw = new LambdaQueryWrapper<>();
        lqw.eq(FavoritesEntity::getBookId,bookId);
        lqw.eq(FavoritesEntity::getUserId,userId);
        return this.remove(lqw);
    }

}