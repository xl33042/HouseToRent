package com.example.wechatsmallprogram.entity;


import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("permission")
public class Permission {

    @TableId("id")
    private int id;

    @TableField("path")
    private String path;

    @TableField("name")
    private String name;
}
