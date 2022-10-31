package com.example.lmsmain.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.lmsmain.entity.FavoritesEntity;
import common.utils.PageUtils;

import java.util.Map;

/**
 * 收藏夹
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-31 12:39:08
 */
public interface FavoritesService extends IService<FavoritesEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

