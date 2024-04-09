package com.example.housetorentrearend.service.backstage;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.housetorentrearend.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface UserService extends IService<User> {
    public User findByAccount(String account);

    Page<User> list(@Param("params") Map params);


}
