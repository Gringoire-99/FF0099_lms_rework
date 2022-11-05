package com.example.lmsadmin.service.impl;

import common.utils.PageUtils;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.example.lmsadmin.dao.FavoritesDao;
import com.example.lmsadmin.entity.FavoritesEntity;
import com.example.lmsadmin.service.FavoritesService;
import common.utils.Query;


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

}