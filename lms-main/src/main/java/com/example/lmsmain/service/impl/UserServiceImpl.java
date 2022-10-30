package com.example.lmsmain.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.lmsmain.dao.UserDao;
import com.example.lmsmain.entity.UserEntity;
import com.example.lmsmain.service.UserService;
import com.sun.corba.se.spi.orbutil.threadpool.WorkQueue;
import com.sun.webkit.graphics.WCRenderQueue;
import common.utils.PageUtils;
import common.utils.Query;
import org.springframework.stereotype.Service;

import java.util.Map;

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
    public UserEntity login(UserEntity user) {
        QueryWrapper<UserEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(user.getUserId()!=null,"userId",user.getUserId());
        wrapper.eq(user.getPassword()!=null,"password",user.getPassword());
        UserEntity userEntity = baseMapper.selectOne(wrapper);
        return userEntity;
    }

    @Override
    public UserEntity getUser(String phoneNumber, String password) {
        QueryWrapper<UserEntity> qw = new QueryWrapper<>();
        qw.eq("phone_number", phoneNumber);
        qw.eq("password", password);
        return baseMapper.selectOne(qw);
    }

}