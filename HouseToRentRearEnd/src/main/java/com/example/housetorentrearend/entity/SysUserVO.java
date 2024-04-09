package com.example.housetorentrearend.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("sys_user")
public class SysUserVO {
    @TableId("userId")
    private int userId;
    @TableField("username")
    private String username;
    @TableField("password")
    private String password;
    @TableField("userType")
    private int userType;
    @TableField("agentId")
    private int agentId;
    @TableField("realName")
    private String realName;
    @TableField("contact")
    private String contact;
    @TableField("mobile")
    private String mobile;
    @TableField("status")
    private int status;
}
