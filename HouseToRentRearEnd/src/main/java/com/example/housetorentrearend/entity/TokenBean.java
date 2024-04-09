package com.example.housetorentrearend.entity;

import lombok.Data;

import java.util.Date;

@Data
public class TokenBean {
    //openid是登录成功后，微信返回的唯一身份认证
    private String openid;
    //token是后台生成的，登录状态识别
    private String token;
    //有效期
    private Date expiredTime;

}
