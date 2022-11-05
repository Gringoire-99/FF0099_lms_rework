package com.example.lmsadmin.entity;

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
 * @date 2022-11-05 19:45:43
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
	private Long dislikes;
	/**
	 * 书id
	 */
	private String bookId;
	/**
	 * 评分
	 */
	private Double score;
	/**
	 * 
	 */
	private Date commentTime;

}
