package com.example.lmsmain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 评论
 * 
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-24 16:13:48
 */
@Data
@TableName("comment")
public class CommentEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 评论内容
	 */
	private String content;
	/**
	 * 评论用户id
	 */
	@TableId
	private Long userId;
	/**
	 * 评论用户名
	 */
	private String userName;
	/**
	 * 头像图片
	 */
	private String avatarPic;
	/**
	 * 点赞数
	 */
	private Long likes;
	/**
	 * 踩数
	 */
	private Long dislikes;
	/**
	 * 书id
	 */
	private Long bookId;

}
