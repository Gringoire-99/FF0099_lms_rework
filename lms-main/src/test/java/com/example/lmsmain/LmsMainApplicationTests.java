package com.example.lmsmain;

import com.example.lmsmain.entity.BorrowRecordEntity;
import com.example.lmsmain.entity.UserEntity;
import com.example.lmsmain.service.impl.BookServiceImpl;
import com.example.lmsmain.service.impl.UserServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashMap;

@SpringBootTest
class LmsMainApplicationTests {
    @Autowired
    BookServiceImpl bookService;
    @Autowired
    UserServiceImpl userService;

    @Test
    void contextLoads() {
        HashMap<String, Object> objectObjectHashMap = new HashMap<>();
        objectObjectHashMap.put("page", "1");
        objectObjectHashMap.put("limit", "10");

        bookService.queryPage(objectObjectHashMap);
    }

    @Test
    void test1() {
        UserEntity user = new UserEntity();
        user.setPassword("123");
        user.setPhoneNumber("123");
        user.setUserName("ds");
        userService.save(user);
    }

    @Test
    void test2() {
        BorrowRecordEntity borrowRecordEntity = new BorrowRecordEntity();
        borrowRecordEntity.setBookId("00e87049-61a1-5021-f2f0-3177e8db71b8");
        bookService.updateByRecord(borrowRecordEntity,1);
    }

}
