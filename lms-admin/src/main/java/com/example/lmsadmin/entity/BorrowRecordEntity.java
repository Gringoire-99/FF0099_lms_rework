package com.example.lmsadmin.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 借书记录
 * 
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-11-05 19:45:43
 */
@Data
@TableName("borrow_record")
public class BorrowRecordEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 用户id
	 */
	@TableId
	private String userId;
	/**
	 * 图书id
	 */
	private String bookId;
	/**
	 * 借书时间
	 */
	private Date borrowTime;
	/**
	 * 还书时间
	 */
	private Date returnTime;

}
