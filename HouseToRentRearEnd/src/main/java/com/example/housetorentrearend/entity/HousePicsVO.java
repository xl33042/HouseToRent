package com.example.housetorentrearend.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("housepics")
public class HousePicsVO {
    @TableId("picId")
    private Integer picId;

    @TableField("picTitle")
    private String picTitle;

    @TableField("url")
    private String url;

    @TableField("houseId")
    private Integer houseId;

    @TableField("seq")
    private Integer seq;
}
