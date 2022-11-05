package com.example.lmsmain.dao;

import com.example.lmsmain.entity.FavoritesEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 收藏夹
 * 
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-31 12:39:08
 */
@Mapper
public interface FavoritesDao extends BaseMapper<FavoritesEntity> {
	
}
