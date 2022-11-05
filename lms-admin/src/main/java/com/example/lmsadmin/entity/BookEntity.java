package com.example.lmsadmin.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 图书表
 * 
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-11-05 19:45:43
 */
@Data
@TableName("book")
public class BookEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 书号
	 */
	@TableId
	private String bookId;
	/**
	 * 是否删除(0-未删, 1-已删)
	 */
	private Integer isDeleted;
	/**
	 * 作者
	 */
	private String author;
	/**
	 * 库存数量
	 */
	private Long number;
	/**
	 * 正在阅读数
	 */
	private Long readingNumber;
	/**
	 * 出版社
	 */
	private String press;
	/**
	 * 书名
	 */
	private String bookName;
	/**
	 * 印刷时间
	 */
	private Date pressTime;
	/**
	 * 收藏
	 */
	private Long stars;
	/**
	 * 点赞数
	 */
	private Long likes;
	/**
	 * 价格
	 */
	private BigDecimal price;
	/**
	 * 摘要
	 */
	private String summary;
	/**
	 * 图片的url地址
	 */
	private String coverPic;
	/**
	 * 字数统计
	 */
	private String wordCount;

}
