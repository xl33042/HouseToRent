package com.example.housetorentrearend.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("maintenance")
public class MaintenanceVO {
    @TableId("mainId")
    private Integer mainId;

    @TableField("houseId")
    private Integer houseId;

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

    @TableField("dealMoney")
    private Float dealMoney;

    @TableField("dealPerson")
    private String dealPerson;

    @TableField("dealResult")
    private String dealResult;

    @TableField("dealTime")
    private Date dealTime;
}
