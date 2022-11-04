package com.example.lmsmain.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.lmsmain.entity.UserEntity;
import com.example.lmsmain.entity.vo.UserCommentVo;
import common.utils.PageUtils;
import common.utils.Query;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.example.lmsmain.dao.CommentDao;
import com.example.lmsmain.entity.CommentEntity;
import com.example.lmsmain.service.CommentService;


@Service("commentService")
public class CommentServiceImpl extends ServiceImpl<CommentDao, CommentEntity> implements CommentService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CommentEntity> page = this.page(
                new Query<CommentEntity>().getPage(params),
                new QueryWrapper<CommentEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public CommentEntity getByIds(String userId, String bookId) {
        LambdaQueryWrapper<CommentEntity> lqw = new LambdaQueryWrapper<>();
        lqw.eq(CommentEntity::getBookId,bookId);
        lqw.eq(CommentEntity::getUserId,userId);
        return this.getOne(lqw);
    }

    @Override
    public void updateComment(CommentEntity comment) {
        LambdaQueryWrapper<CommentEntity> lqw = new LambdaQueryWrapper<>();
        lqw.eq(CommentEntity::getBookId,comment.getBookId());
        lqw.eq(CommentEntity::getUserId,comment.getUserId());
        this.update(comment,lqw);
    }

    @Override
    public List<UserCommentVo> getComments(Map<String, Object> params) {
        return this.baseMapper.getComments(params);
    }

}