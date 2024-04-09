package com.villege.entity.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import java.io.File;
import java.io.Serializable;
import java.util.Date;

@Data
@TableName("agentinfo")
@ApiModel(value = "AgentInfoEntity",description = "系统参数描述")
public class AgentInfoEntity implements Serializable {
    public static final long serialVersionUID = 1L;
    @ApiModelProperty("单位ID")
    @TableId(value="agentId")
    private long agentId;
    @TableField("agentNo")
    @NotBlank(message="单位编号不能为空")
    @Length(min=2,max=2,message="单位编号长度必须为2")
    @ApiModelProperty("单位编号")
    private String agentNo;
    @TableField("agentName")
    @NotBlank(message="单位名称不能为空")
    @ApiModelProperty("单位名称")
    private String agentName;

    @TableField("agentIcon")
    @ApiModelProperty("单位LOGO")
    private String agentIcon;
    @TableField("contact")
    @NotBlank(message="联系人不能为空")
    @ApiModelProperty("联系人")
    private String contact;
    @TableField("mobile")
    @NotBlank(message="联系方式不能为空")
    @ApiModelProperty("手机号码")
    private String mobile;
    @TableField("address")
    @ApiModelProperty("地址")
    private String address;
    @TableField("registerTime")
    @ApiModelProperty("注册时间")
    private Date registerTime;
    @TableField("state")
    @ApiModelProperty("用户状态(1有效，0无效)")
    private int state;
    @TableField("managerName")
    @ApiModelProperty("创建人")
    private String managerName;
    @TableField("aboutUs")
    @ApiModelProperty("关于我们")
    private String aboutUs;
    @TableField("remark")
    @ApiModelProperty("备注")
    private String remark;

    @TableField(exist = false)
    private File upload;
}
