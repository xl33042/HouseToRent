package com.example.housetorentrearend.service.impl.backstage;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.housetorentrearend.dao.backstage.UserMapper;
import com.example.housetorentrearend.entity.User;
import com.example.housetorentrearend.service.backstage.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("userService2")
public class UserServiceImpl extends ServiceImpl<UserMapper,User> implements UserService {

    @Autowired
    private UserMapper userMapper;






    @Override
    public User findByAccount(String account) {
        return userMapper.findByAccount(account);
    }

    @Override
    public Page<User> list(Map params) {
        Page<User> page = new Page<>((int)params.get("current"), 3);
        page.setRecords(userMapper.userList(page,params));

        return page;
    }

}