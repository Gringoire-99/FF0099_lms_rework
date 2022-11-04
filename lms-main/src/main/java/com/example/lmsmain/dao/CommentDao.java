package com.example.lmsmain.dao;

import com.example.lmsmain.entity.CommentEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.lmsmain.entity.vo.UserCommentVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 评论
 * 
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-31 12:39:08
 */
@Mapper
public interface CommentDao extends BaseMapper<CommentEntity> {
    List<UserCommentVo> getComments(Map<String, Object> params);
}
