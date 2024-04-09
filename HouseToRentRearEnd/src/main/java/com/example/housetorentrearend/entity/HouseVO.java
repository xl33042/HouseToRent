package com.example.housetorentrearend.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("house")
public class HouseVO {
    @TableId("houseId")
    private Integer houseId;

    @TableField("communityId")
    private Long communityId;

    @TableField("termName")
    private String termName;

    @TableField("houseName")
    private String houseName;

    @TableField("`struct`")
    private String struct;

    @TableField("`inner`")
    private String inner;

    @TableField("area")
    private Float area;

    @TableField("lentMoney")
    private Float lentMoney;

    @TableField("deposit")
    private Float deposit;

    @TableField("houseMoney")
    private Float houseMoney;

    @TableField("waterMoney")
    private Float waterMoney;

    @TableField("electricMoney")
    private Float electricMoney;

    @TableField("gasMoney")
    private Float gasMoney;

    @TableField("otherMoney")
    private Float otherMoney;

    @TableField("state")
    private Integer state;

    @TableField("expireDate")
    private Date expireDate;

    @TableField("remark")
    private String remark;
}
