package com.example.lmsmain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 管理员列表
 * 
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-31 12:39:08
 */
@Data
@TableName("admin")
public class AdminEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 管理员名
	 */
	private String adminName;
	/**
	 * id
	 */
	@TableId
	private String adminId;
	/**
	 * 电话
	 */
	private String phoneNumber;
	/**
	 * 头像图片
	 */
	private String avatarPic;
	/**
	 * 
	 */
	private String password;

}
