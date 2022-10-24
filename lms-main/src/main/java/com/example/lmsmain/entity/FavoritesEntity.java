package com.example.lmsmain.entity;

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
 * @date 2022-10-24 16:13:48
 */
@Data
@TableName("favorites")
public class FavoritesEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 收藏书id
	 */
	@TableId
	private Long bookId;
	/**
	 * 收藏人d
	 */
	private Long userId;
	/**
	 * 收藏url
	 */
	private String url;

}
