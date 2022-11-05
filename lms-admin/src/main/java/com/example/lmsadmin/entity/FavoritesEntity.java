package com.example.lmsadmin.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 收藏夹
 * 
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-11-05 19:45:43
 */
@Data
@TableName("favorites")
public class FavoritesEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 收藏书id
	 */
	@TableId
	private String bookId;
	/**
	 * 收藏人id
	 */
	private String userId;
	/**
	 * 收藏url
	 */
	private String url;

}
