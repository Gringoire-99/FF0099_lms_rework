package com.example.lmsmain.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.lmsmain.entity.CommentEntity;
import common.utils.PageUtils;

import java.util.Map;

/**
 * 评论
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-31 12:39:08
 */
public interface CommentService extends IService<CommentEntity> {

    PageUtils queryPage(Map<String, Object> params);

    CommentEntity getByIds(String userId, String bookId);

    void updateComment(CommentEntity comment);

    PageUtils getComments(Map<String, Object> params);

    Integer getTotalCount(String bookId);

    void updateLike(String bookId, String userId);
}

