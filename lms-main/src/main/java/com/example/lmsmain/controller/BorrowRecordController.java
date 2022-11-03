package com.example.lmsmain.controller;

import com.example.lmsmain.entity.BorrowRecordEntity;
import com.example.lmsmain.service.BorrowRecordService;
import com.example.lmsmain.service.impl.BookServiceImpl;
import common.utils.PageUtils;
import common.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


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
    @Autowired
    private BookServiceImpl bookService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = borrowRecordService.queryPage(params);

        return R.ok().put("page", page);
    }

    @RequestMapping("/getRecords")
    public R getRecords(@RequestParam Map<String, Object> params) {
        PageUtils recordsById = borrowRecordService.getRecordsById(params);
        return R.ok().put("page", recordsById);
        }

    /**
     * 信息
     */
    @RequestMapping("/info/{userId}/{bookId}")
    public R info(@PathVariable("userId") String userId, @PathVariable("bookId") String bookId) {
        BorrowRecordEntity borrowRecord = borrowRecordService.getByIds(userId, bookId);
        return R.ok().put("borrowRecord", borrowRecord);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @Transactional
    public R save(@RequestBody BorrowRecordEntity borrowRecord) {
        try {
            bookService.updateByRecord(borrowRecord, -1);
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("库存不足");
        }
        try {
            borrowRecordService.save(borrowRecord);

        } catch (Exception e) {
            return R.error("已借阅");
        }

        return R.ok("借阅成功");
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody BorrowRecordEntity borrowRecord) {
        borrowRecordService.updateById(borrowRecord);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @Transactional
    public R delete(@RequestBody BorrowRecordEntity borrowRecord) {
        try {
            if (borrowRecordService.getByIds(borrowRecord.getUserId(), borrowRecord.getBookId()) != null) {
                if (borrowRecordService.deleteRecord(borrowRecord)) {
                    bookService.updateByRecord(borrowRecord, 1);
                    return R.ok("归还成功");
                }
            } else {
                return R.error("无此书借书记录");
            }
            return R.error("还书失败");
        } catch (Exception e) {
            return R.error();
        }
    }

}
