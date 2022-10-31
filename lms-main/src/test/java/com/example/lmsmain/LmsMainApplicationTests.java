package com.example.lmsmain;

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
    void test1(){
        UserEntity user = new UserEntity();
        user.setPassword("123");
        user.setPhoneNumber("123");
        user.setUserName("ds");
        userService.save(user);
    }

}
