package com.example.housetorentrearend.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

@Data
@ToString
@TableName("role")
public class Role implements Serializable {

    private static final long serialVersionUID = -1767327914553823741L;

    @TableId("id")
    private Integer id;

    @TableField("roleName")
    private String roleName;


}
