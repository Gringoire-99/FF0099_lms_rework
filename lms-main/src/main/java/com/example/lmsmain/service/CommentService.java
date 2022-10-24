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
 * @date 2022-10-24 16:13:48
 */
public interface CommentService extends IService<CommentEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

