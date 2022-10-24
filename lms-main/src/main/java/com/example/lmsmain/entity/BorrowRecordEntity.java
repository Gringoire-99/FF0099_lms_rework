package com.example.lmsmain.entity;

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
 * @date 2022-10-24 16:13:48
 */
@Data
@TableName("borrow_record")
public class BorrowRecordEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 用户id
	 */
	@TableId
	private Long userId;
	/**
	 * 图书id
	 */
	private Long bookId;
	/**
	 * 借书时间
	 */
	private Date borrowTime;
	/**
	 * 还书时间
	 */
	private Long returnTime;

}
