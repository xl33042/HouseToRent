package com.example.housetorentrearend.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("contract")
public class ContractVO {
    @TableId("contractId")
    private Integer contractId;

    @TableField("houseId")
    private Integer houseId;

    @TableField("personId")
    private Integer personId;

    @TableField("url")
    private String url;

    @TableField("title")
    private String title;

    @TableField("seq")
    private Integer seq;
}
