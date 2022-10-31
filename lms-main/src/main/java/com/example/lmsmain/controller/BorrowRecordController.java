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

import com.example.lmsmain.entity.BorrowRecordEntity;
import com.example.lmsmain.service.BorrowRecordService;




/**
 * 借书记录
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-31 12:39:08
 */
@RestController
@RequestMapping("lmsmain/borrowrecord")
public class BorrowRecordController {
    @Autowired
    private BorrowRecordService borrowRecordService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = borrowRecordService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{userId}")
    public R info(@PathVariable("userId") Long userId){
		BorrowRecordEntity borrowRecord = borrowRecordService.getById(userId);

        return R.ok().put("borrowRecord", borrowRecord);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody BorrowRecordEntity borrowRecord){
		borrowRecordService.save(borrowRecord);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody BorrowRecordEntity borrowRecord){
		borrowRecordService.updateById(borrowRecord);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] userIds){
		borrowRecordService.removeByIds(Arrays.asList(userIds));

        return R.ok();
    }

}
