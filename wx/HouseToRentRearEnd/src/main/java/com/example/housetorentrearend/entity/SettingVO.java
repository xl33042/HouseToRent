package com.example.housetorentrearend.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("setting")
public class SettingVO {
    @TableId("settingId")
    private Integer settingId;

    @TableField("eletricFee")
    private Float eletricFee;

    @TableField("waterFee")
    private Float waterFee;

    @TableField("gasFee")
    private Float gasFee;

    @TableField("serviceFee")
    private Float serviceFee;
}
