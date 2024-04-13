package com.example.wechatsmallprogram.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.wechatsmallprogram.entity.PersonInfoVO;


public interface PersonInfoService extends IService<PersonInfoVO> {




    //登录或者注册
    PersonInfoVO verifyLoginOrRegistration(String mobile, String password);
}
