package com.example.wechatsmallprogram.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.sql.Timestamp;

@Data
@TableName("community")
public class CommunityVO {
    @TableId("communityId")
    private Long communityId;

    @TableField("communityName")
    private String communityName;

    @TableField("seq")
    private Long seq;

    @TableField("creater")
    private String creater;

    @TableField("createrTime")
    private Timestamp createrTime;

    @TableField("lng")
    private Float lng;

    @TableField("lat")
    private Float lat;

    @TableField("remark")
    private String remark;

    @TableField("agentId")
    private Integer agentId;
}
