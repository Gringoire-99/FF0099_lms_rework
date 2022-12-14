package com.example.lmsmain.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.lmsmain.entity.BookEntity;
import com.example.lmsmain.entity.BorrowRecordEntity;
import com.example.lmsmain.entity.FavoritesEntity;
import common.utils.PageUtils;
import common.utils.R;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;
import java.util.Map;

/**
 * 图书表
 *
 * @author gg
 * @email ggs@gmail.com
 * @date 2022-10-31 12:39:08
 */
public interface BookService extends IService<BookEntity> {

    PageUtils queryPage(Map<String, Object> params);
     void updateByRecord(BorrowRecordEntity borrowRecord,Integer number);

    List<BookEntity> getBooksByRecord(List<BorrowRecordEntity> records);

    void updateByFavorite(FavoritesEntity favorites, int i);

    List<BookEntity> getBooksByFavorites(List<FavoritesEntity> favoritesEntities);

    void updateLike(String bookId);
}

