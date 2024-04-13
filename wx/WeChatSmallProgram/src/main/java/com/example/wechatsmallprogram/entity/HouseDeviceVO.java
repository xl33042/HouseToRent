package com.example.wechatsmallprogram.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("housedevice")
public class HouseDeviceVO {
    @TableId("deviceId")
    private Integer deviceId;

    @TableField("deviceName")
    private String deviceName;

    @TableField("cnt")
    private Integer cnt;

    @TableField("price")
    private Float price;

    @TableField("houseId")
    private Integer houseId;

    @TableField("remark")
    private String remark;
}
