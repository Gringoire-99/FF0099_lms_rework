package com.example.lmsmain.controller;

import com.example.lmsmain.entity.FavoritesEntity;
import com.example.lmsmain.service.FavoritesService;
import com.example.lmsmain.service.impl.BookServiceImpl;
import common.utils.PageUtils;
import common.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


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

    @Autowired
    private BookServiceImpl bookService;
    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = favoritesService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{bookId}/{userId}")
    public R info(@PathVariable("bookId") String bookId, @PathVariable("userId") String userId) {
        FavoritesEntity favorites = favoritesService.getByIds(bookId, userId);

        return R.ok().put("favorites", favorites);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody FavoritesEntity favorites) {
        if (favoritesService.getByIds(favorites.getBookId(), favorites.getUserId()) != null) {
            favoritesService.removeById(favorites.getBookId(), favorites.getUserId());
            bookService.updateByFavorite(favorites,-1);
            return R.ok("取消收藏");
        }
        favoritesService.save(favorites);
        bookService.updateByFavorite(favorites,1);
        return R.ok("收藏成功");
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody FavoritesEntity favorites) {
        favoritesService.updateById(favorites);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody String[] bookIds) {
        favoritesService.removeByIds(Arrays.asList(bookIds));

        return R.ok();
    }

}
