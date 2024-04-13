package com.example.wechatsmallprogram.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("sys_log")
public class SysLogVO {
    @TableId("id")
    private Long id;

    @TableField("username")
    private String username;

    @TableField("operation")
    private String operation;

    @TableField("method")
    private String method;

    @TableField("params")
    private String params;

    @TableField("time")
    private Integer time;

    @TableField("ip")
    private String ip;


    @TableField("create_time")
    private Date createTime;
}
