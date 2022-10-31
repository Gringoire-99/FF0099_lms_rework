package com.example.lmsmain.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.lmsmain.entity.BorrowRecordEntity;
import common.utils.PageUtils;

import java.util.Map;

/**
 * 借书记录
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-31 12:39:08
 */
public interface BorrowRecordService extends IService<BorrowRecordEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

