package com.example.housetorentrearend;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.EnableAspectJAutoProxy;


@EnableAspectJAutoProxy
@MapperScan("com.example.housetorentrearend.dao")
@ServletComponentScan
@SpringBootApplication
public class HouseToRentRearEndApplication {

    public static void main(String[] args) {
        SpringApplication.run(HouseToRentRearEndApplication.class, args);
    }

}
