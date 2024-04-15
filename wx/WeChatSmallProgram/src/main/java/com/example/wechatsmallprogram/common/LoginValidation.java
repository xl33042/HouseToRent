package com.example.wechatsmallprogram.common;


import org.apache.http.HttpStatus;

import java.util.HashMap;

public class LoginValidation extends HashMap<String, Object> {



    public LoginValidation(Integer code, String message) {

        put("code",code);
        put("msg", message);

    }


    public static final LoginValidation SUCCESS(String token) {
        return new LoginValidation(1, token);
    }


    public static final LoginValidation ERROR() {
        return new LoginValidation(2, "失败");
    }


    public static final LoginValidation MOBILE_ERROR() {
        return new LoginValidation(3, "手机号格式错误");
    }

    public static final LoginValidation PASSWORD_ERROR() {
        return new LoginValidation(4, "您的密码格式错误（密码一共要10位，必须包含字母和数字）");
    }

    public static final LoginValidation ACCOUNT_IS_DISABLED() {
        return new LoginValidation(5, "您被封禁请联系管理员肖磊（18579751628）解禁账号");
    }

    public static final LoginValidation INCORRECT_CREDENTIALS() {
        return new LoginValidation(6, "您的手机号或密码有误");
    }

    public static final LoginValidation NOT_LOGIN_IN() {
        return new LoginValidation(7, "账号未登录");
    }

    public static final LoginValidation UNAUTHORIZED() {
        return new LoginValidation(8, "没有权限");
    }

}
