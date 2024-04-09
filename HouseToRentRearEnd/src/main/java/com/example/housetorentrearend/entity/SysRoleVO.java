package com.example.housetorentrearend.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("sys_role")
public class SysRoleVO {
    @TableId("role_id")
    private Long roleId;

    @TableField("role_name")
    private String roleName;

    @TableField("type")
    private Integer type;

    @TableField("remark")
    private String remark;

    @TableField("create_time")
    private Date createTime;

    @TableField("deleted")
    private Integer deleted;
}
