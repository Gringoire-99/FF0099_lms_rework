package com.example.lmsmain.service.impl;

import common.utils.PageUtils;
import common.utils.Query;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.example.lmsmain.dao.UserDao;
import com.example.lmsmain.entity.UserEntity;
import com.example.lmsmain.service.UserService;


@Service("userService")
public class UserServiceImpl extends ServiceImpl<UserDao, UserEntity> implements UserService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<UserEntity> page = this.page(
                new Query<UserEntity>().getPage(params),
                new QueryWrapper<UserEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public UserEntity doLogin(Map<String, Object> params) {
        String password = (String) params.get("password");
        String phone = (String) params.get("phone");
        if (password!=null&&phone!=null){
            QueryWrapper<UserEntity> qw = new QueryWrapper<>();
            qw.eq("user.password",password);
            qw.eq("user.phone_number",phone);
            return baseMapper.selectOne(qw);
        }
        return null;
    }

}