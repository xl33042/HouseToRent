package com.example.wechatsmallprogram.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("personinfo")
public class PersonInfoVO {
    @TableId("personId")
    private Integer personId;

    @TableField("userName")
    private String userName;

    @TableField("password")
    private String password;

    @TableField("houseId")
    private Integer houseId;

    @TableField("sex")
    private String sex;

    @TableField("mobile")
    private String mobile;

    @TableField("cardNo")
    private String cardNo;

    @TableField("cardPic1")
    private String cardPic1;

    @TableField("cardPic2")
    private String cardPic2;

    @TableField("faceUrl")
    private String faceUrl;

    @TableField("state")
    private Integer state;

    @TableField("createrTime")
    private Date createrTime;

    @TableField("openId")
    private String openId;

    @TableField("remark")
    private String remark;
}
