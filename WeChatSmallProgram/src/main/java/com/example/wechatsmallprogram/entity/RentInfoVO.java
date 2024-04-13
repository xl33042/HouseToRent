package com.example.wechatsmallprogram.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("rentinfo")
public class RentInfoVO {
    @TableId("rentInfoId")
    private Integer rentInfoId;

    @TableField("personId")
    private Integer personId;

    @TableField("houseId")
    private Integer houseId;

    @TableField("rentMoney")
    private Float rentMoney;

    @TableField("deposit")
    private Float deposit;

    @TableField("eletricNo")
    private String eletricNo;

    @TableField("waterNo")
    private String waterNo;

    @TableField("gasNo")
    private String gasNo;

    @TableField("state")
    private Integer state;

    @TableField("startDate")
    private Date startDate;

    @TableField("endDate")
    private Date endDate;

    @TableField("remark")
    private String remark;
}
