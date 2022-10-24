package com.example.lmsmain;

import com.example.lmsmain.service.impl.BookServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashMap;

@SpringBootTest
class LmsMainApplicationTests {
    @Autowired
    BookServiceImpl bookService;

    @Test
    void contextLoads() {
        HashMap<String, Object> objectObjectHashMap = new HashMap<>();
        objectObjectHashMap.put("page", "1");
        objectObjectHashMap.put("limit", "10");

        bookService.queryPage(objectObjectHashMap);
    }

}
