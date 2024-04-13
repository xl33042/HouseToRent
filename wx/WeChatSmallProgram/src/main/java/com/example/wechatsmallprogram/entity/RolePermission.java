package com.example.wechatsmallprogram.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("role_permission")
public class RolePermission {
    @TableId("id")
    private int id;

    @TableField("role_id")
    private int roleId;

    @TableField(exist = false)
    private String permissionName;

    @TableField("permission_id")
    private int permissionId;

    @TableField(exist = false)
    private String permission;
}
