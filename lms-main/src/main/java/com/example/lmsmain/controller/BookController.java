package com.example.lmsmain.controller;

import com.example.lmsmain.entity.BookEntity;
import com.example.lmsmain.entity.BorrowRecordEntity;
import com.example.lmsmain.entity.FavoritesEntity;
import com.example.lmsmain.service.BookService;
import common.utils.PageUtils;
import common.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;


/**
 * 图书表
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-31 12:39:08
 */
@RestController
@RequestMapping("lmsmain/book")
public class BookController {
    @Autowired
    private BookService bookService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = bookService.queryPage(params);

        return R.ok().put("page", page);
    }
    //TODO 需要被改造为VO
    @RequestMapping("/getBooksByRecord")
    public R getBooksByRecord(@RequestBody List<BorrowRecordEntity> records) {
        List<BookEntity> books = bookService.getBooksByRecord(records);
        return R.ok().put("list",books);
    }
    @RequestMapping("/getBooksByFavorites")
    public R getBooksByFavorite(@RequestBody List<FavoritesEntity> favoritesEntities) {
        List<BookEntity> books = bookService.getBooksByFavorites(favoritesEntities);
        return R.ok().put("list",books);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{bookId}")
    public R info(@PathVariable("bookId") String bookId) {
        BookEntity book = bookService.getById(bookId);

        return R.ok().put("book", book);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody BookEntity book) {
        bookService.save(book);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody BookEntity book) {
        bookService.updateById(book);
        return R.ok();
    }
    @RequestMapping("/updateLike/{bookId}")
    public R updateLike(@PathVariable("bookId") String bookId) {
        bookService.updateLike(bookId);
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody String[] bookIds) {
        bookService.removeByIds(Arrays.asList(bookIds));

        return R.ok();
    }

}
