package com.example.lmsadmin.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 用户
 * 
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-11-05 19:45:43
 */
@Data
@TableName("user")
public class UserEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 用户名
	 */
	private String userName;
	/**
	 * 用户id
	 */
	@TableId
	private String userId;
	/**
	 * 密码
	 */
	private String password;
	/**
	 * 用户性别
	 */
	private String gender;
	/**
	 * 手机号
	 */
	private String phoneNumber;
	/**
	 * 借阅数
	 */
	private Integer borrowNumber;
	/**
	 * 邮箱
	 */
	private String email;
	/**
	 * 头像
	 */
	private String avatarPic;
	/**
	 * 余额
	 */
	private BigDecimal balance;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 出生日期
	 */
	private Date birthdate;

}
