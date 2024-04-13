package com.example.wechatsmallprogram.common;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@Data
@ApiModel("响应实体")
public class R<T> implements Serializable {

    @ApiModelProperty("响应状态码")
    private int code = 200;

    @ApiModelProperty("响应信息")
    private String msg = "操作成功";

    @ApiModelProperty("异常信息")
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private String errMsg = null;

    @ApiModelProperty("响应数据")
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private T data = null;

    public R() {
    }

    public R(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public R(T data) {
        this.data = data;
    }

    public R(int code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static <T> R<T> ok() {
        return new R<>();
    }

    public static <T> R<T> ok(T data) {
        return new R<>(data);
    }

    public static <T> R<T> error() {
        return new R<>(500, "操作失败");
    }

    public static <T> R<T> error(String msg) {
        return new R<>(500, msg);
    }

    public static <T> R<T> error(String msg, String errMsg) {
        R<T> r = new R<>(500, msg);
        r.setErrMsg(errMsg);
        return r;
    }

    public static <T> R<T> error(int code, String msg) {
        return new R<>(code, msg);
    }
}
