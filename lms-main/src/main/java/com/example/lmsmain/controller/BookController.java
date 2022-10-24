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

import com.example.lmsmain.entity.BookEntity;
import com.example.lmsmain.service.BookService;




/**
 * 图书表
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-24 16:13:48
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
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = bookService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{bookId}")
    public R info(@PathVariable("bookId") Long bookId){
		BookEntity book = bookService.getById(bookId);

        return R.ok().put("book", book);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody BookEntity book){
		bookService.save(book);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody BookEntity book){
		bookService.updateById(book);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] bookIds){
		bookService.removeByIds(Arrays.asList(bookIds));

        return R.ok();
    }

}
