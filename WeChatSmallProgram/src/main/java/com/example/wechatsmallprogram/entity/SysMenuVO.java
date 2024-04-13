package com.example.wechatsmallprogram.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("sys_menu")
public class SysMenuVO {
    @TableId("id")
    private Long id;

    @TableField("parent_id")
    private Long parentId;

    @TableField("name")
    private String name;

    @TableField("path")
    private String path;

    @TableField("component")
    private String component;

    @TableField("menu_type")
    private Integer menuType;

    @TableField("status")
    private Integer status;

    @TableField("perms")
    private String perms;

    @TableField("is_frame")
    private Integer isFrame;

    @TableField("icon")
    private String icon;

    @TableField("sort")
    private Integer sort;

    @TableField("deleted")
    private Integer deleted;

    @TableField("hidden")
    private String hidden;
}
