package com.example.lmsadmin.controller;

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

import com.example.lmsadmin.entity.CommentEntity;
import com.example.lmsadmin.service.CommentService;




/**
 * 评论
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-11-05 19:45:43
 */
@RestController
@RequestMapping("lmsadmin/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = commentService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{userId}")
    public R info(@PathVariable("userId") String userId){
		CommentEntity comment = commentService.getById(userId);

        return R.ok().put("comment", comment);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody CommentEntity comment){
		commentService.save(comment);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody CommentEntity comment){
		commentService.updateById(comment);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody String[] userIds){
		commentService.removeByIds(Arrays.asList(userIds));

        return R.ok();
    }

}
