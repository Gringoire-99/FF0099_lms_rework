package com.example.lmsmain.controller;

import com.example.lmsmain.entity.CommentEntity;
import com.example.lmsmain.service.CommentService;
import common.utils.PageUtils;
import common.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


/**
 * 评论
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-31 12:39:08
 */
@RestController
@RequestMapping("lmsmain/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = commentService.queryPage(params);

        return R.ok().put("page", page);
    }

    @RequestMapping("/comments")
    public R comments(@RequestParam Map<String, Object> params) {
        PageUtils page = commentService.getComments(params);
        return R.ok().put("page", page);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{userId}/{bookId}")
    public R info(@PathVariable("userId") String userId, @PathVariable("bookId") String bookId) {
        CommentEntity comment = commentService.getByIds(userId, bookId);

        return R.ok().put("comment", comment);
    }

    @RequestMapping("/updateLike/{bookId}/{userId}")
    public R updateLike(@PathVariable("bookId") String bookId,@PathVariable("userId") String userId) {
        commentService.updateLike(bookId,userId);
        return R.ok();
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody CommentEntity comment) {
        CommentEntity old = commentService.getByIds(comment.getUserId(), comment.getBookId());
        if (old != null) {
            commentService.updateComment(comment);
            return R.ok("已更新评论！");
        }
        commentService.save(comment);
        return R.ok("已上传！");
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody CommentEntity comment) {
        commentService.updateById(comment);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody String[] userIds) {
        commentService.removeByIds(Arrays.asList(userIds));

        return R.ok();
    }

}
