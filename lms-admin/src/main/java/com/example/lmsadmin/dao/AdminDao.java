package com.example.lmsadmin.dao;

import com.example.lmsadmin.entity.AdminEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 管理员列表
 * 
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-11-05 19:45:43
 */
@Mapper
public interface AdminDao extends BaseMapper<AdminEntity> {
	
}
