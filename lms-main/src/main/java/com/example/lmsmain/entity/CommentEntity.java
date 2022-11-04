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
 * @date 2022-10-31 12:39:08
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
	 * 书id
	 */
	private String bookId;
	/**
	 * 评论时间
	 */
	private String commentTime;
	/**
	 * 评分
	 */
	private Double score;

}
