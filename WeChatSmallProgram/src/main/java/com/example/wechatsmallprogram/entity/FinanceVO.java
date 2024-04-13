package com.example.wechatsmallprogram.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("finance")
public class FinanceVO {
    @TableId("financeId")
    private Integer financeId;

    @TableField("paidMonth")
    private String paidMonth;

    @TableField("houseId")
    private Integer houseId;

    @TableField("rentMoney")
    private Float rentMoney;

    @TableField("depositMoney")
    private Float depositMoney;

    @TableField("houseMoney")
    private Float houseMoney;

    @TableField("eletricMoney")
    private Float eletricMoney;

    @TableField("waterMoney")
    private Float waterMoney;

    @TableField("gasMoney")
    private Float gasMoney;

    @TableField("otherMoney")
    private Float otherMoney;

    @TableField("totalMoney")
    private Float totalMoney;

    @TableField("waterNo")
    private Float waterNo;

    @TableField("eletricNo")
    private Float eletricNo;

    @TableField("gasNo")
    private Float gasNo;

    @TableField("state")
    private Integer state;

    @TableField("paidType")
    private Integer paidType;

    @TableField("paidDate")
    private Date paidDate;

    @TableField("operTime")
    private Date operTime;

    @TableField("operator")
    private String operator;

    @TableField("remark")
    private String remark;
}
