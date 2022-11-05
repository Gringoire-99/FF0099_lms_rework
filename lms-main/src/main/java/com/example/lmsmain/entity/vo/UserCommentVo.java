package com.example.lmsmain.entity.vo;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class UserCommentVo {
    private static final long serialVersionUID = 1L;
    private String content;
    /**
     * 评论用户id
     */
    @TableId
    private String userId;
    /**
     * 点赞数
     */
    private Long likes;
    /**
     * 踩数
     */
    private String dislikes;
    /**
     * 评分
     */
    private Double score;

    /**
     * 用户名
     */
    private String userName;
    /**
     * 头像
     */
    private String avatarPic;

}
