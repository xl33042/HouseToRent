package com.example.wechatsmallprogram;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.EnableAspectJAutoProxy;


@EnableAspectJAutoProxy
@MapperScan("com.example.wechatsmallprogram.mapper")
@ServletComponentScan
@SpringBootApplication
public class WeChatSmallProgramApplication {

    public static void main(String[] args) {
        SpringApplication.run(WeChatSmallProgramApplication.class, args);
    }

}
