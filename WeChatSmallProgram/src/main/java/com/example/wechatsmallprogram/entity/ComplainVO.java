package com.example.wechatsmallprogram.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("complain")
public class ComplainVO {
    @TableId("complainId")
    private Integer complainId;

    @TableField("houseId")
    private Integer houseId;

    @TableField("title")
    private String title;

    @TableField("content")
    private String content;

    @TableField("creator")
    private String creator;

    @TableField("phone")
    private String phone;

    @TableField("createTime")
    private Date createTime;

    @TableField("state")
    private Integer state;

    @TableField("dealPerson")
    private String dealPerson;

    @TableField("dealResult")
    private String dealResult;

    @TableField("dealTime")
    private Date dealTime;
}
