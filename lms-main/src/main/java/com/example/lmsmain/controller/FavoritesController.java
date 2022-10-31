package com.example.lmsmain.controller;

import java.util.Arrays;
import java.util.Map;

import common.utils.PageUtils;
import common.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.lmsmain.entity.FavoritesEntity;
import com.example.lmsmain.service.FavoritesService;




/**
 * 收藏夹
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-31 12:39:08
 */
@RestController
@RequestMapping("lmsmain/favorites")
public class FavoritesController {
    @Autowired
    private FavoritesService favoritesService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = favoritesService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{bookId}")
    public R info(@PathVariable("bookId") Long bookId){
		FavoritesEntity favorites = favoritesService.getById(bookId);

        return R.ok().put("favorites", favorites);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody FavoritesEntity favorites){
		favoritesService.save(favorites);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody FavoritesEntity favorites){
		favoritesService.updateById(favorites);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] bookIds){
		favoritesService.removeByIds(Arrays.asList(bookIds));

        return R.ok();
    }

}
