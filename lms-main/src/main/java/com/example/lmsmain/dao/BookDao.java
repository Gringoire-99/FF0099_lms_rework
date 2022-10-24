package com.example.lmsmain.dao;

import com.example.lmsmain.entity.BookEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 图书表
 * 
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-24 16:13:48
 */
@Mapper
public interface BookDao extends BaseMapper<BookEntity> {
	
}
