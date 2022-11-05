package com.example.lmsadmin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class LmsAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(LmsAdminApplication.class, args);
    }

}
