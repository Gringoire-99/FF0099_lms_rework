package com.example.lmsadmin.dao;

import com.example.lmsadmin.entity.FavoritesEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 收藏夹
 * 
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-11-05 19:45:43
 */
@Mapper
public interface FavoritesDao extends BaseMapper<FavoritesEntity> {
	
}
