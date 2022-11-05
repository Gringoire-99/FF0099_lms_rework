package com.example.lmsadmin.dao;

import com.example.lmsadmin.entity.BookEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 图书表
 * 
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-11-05 19:45:43
 */
@Mapper
public interface BookDao extends BaseMapper<BookEntity> {
	
}
