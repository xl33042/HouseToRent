package com.example.wechatsmallprogram.aop;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LogAspect {


    //前置通知
    @Before(value = "execution(public * com.example.housetorentrearend.controller.*.*(..))")
    public void beforeMethod(JoinPoint joinPoint){
        String name = joinPoint.getSignature().getName();
        System.out.println(name+"方法开始执行...");
    }


    //后置通知
    @After(value = "execution(public * com.example.housetorentrearend.controller.*.*(..))")
    public void after(JoinPoint joinPoint){
        String name = joinPoint.getSignature().getName();
        System.out.println(name+"方法执行结束...");
    }
}
