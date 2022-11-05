package com.example.lmsadmin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.lmsadmin.entity.BorrowRecordEntity;
import common.utils.PageUtils;

import java.util.Map;

/**
 * 借书记录
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-11-05 19:45:43
 */
public interface BorrowRecordService extends IService<BorrowRecordEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

