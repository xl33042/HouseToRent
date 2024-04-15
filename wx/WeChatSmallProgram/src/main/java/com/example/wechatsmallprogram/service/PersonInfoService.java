package com.example.wechatsmallprogram.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.wechatsmallprogram.entity.PersonInfoVO;


public interface PersonInfoService extends IService<PersonInfoVO> {




    //登录或者注册
    PersonInfoVO verifyLoginOrRegistration(String mobile, String password);


    //返回个人中心的数据
    PersonInfoVO userData(int id);

    //更改用户数据
    void updateUserData(PersonInfoVO personInfoVO);
}
