package com.example.wechatsmallprogram.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.ToString;

import java.io.Serializable;
import java.util.ArrayList;

@Data
@ToString
@TableName("user")
public class User  implements Serializable {

    private static final long serialVersionUID = -6056125703075132981L;

    @TableId("id")
    private Integer id;

    @TableField("account")
    private String account;

    @TableField("password")
    private String password;

    @TableField("username")
    private String username;

    @TableField(exist = false)
    private ArrayList<Role> roles;

    @TableField(exist = false)
    private ArrayList<Integer> roleIds;
}
