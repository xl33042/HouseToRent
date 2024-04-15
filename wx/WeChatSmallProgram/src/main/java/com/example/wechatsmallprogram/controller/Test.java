package com.example.wechatsmallprogram.controller;

import cn.hutool.core.date.DateUtil;
import com.example.wechatsmallprogram.common.LoginValidation;

import java.util.Date;

public class Test {
    public static void main(String[] args) {
        Date date = new Date();

        String format = DateUtil.format(date, "yyyy-MM-dd HH:mm:ss");
        System.out.println(format);
        System.out.println(LoginValidation.NOT_LOGIN_IN());

    }
}
