package com.example.housetorentrearend.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.sql.Timestamp;

@Data
@TableName("agentinfo")
public class AgentInfoVO {
    @TableId("agentId")
    private int agentId;

    @TableField("agentNo")
    private String agentNo;

    @TableField("agentName")
    private String agentName;

    @TableField("agentIcon")
    private String agentIcon;

    @TableField("contact")
    private String contact;

    @TableField("mobile")
    private String mobile;

    @TableField("address")
    private String address;

    @TableField("registerTime")
    private Timestamp registerTime;

    @TableField("state")
    private int state;

    @TableField("managerName")
    private String managerName;

    @TableField("aboutUs")
    private String aboutUs;

    @TableField("remark")
    private String remark;
}
