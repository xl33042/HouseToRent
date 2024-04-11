package com.ruoyi.framework.aspectj;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class SysLogAspect {

    @Before(value = "@annotation(com.ruoyi.common.annotation.SysLog)")
    public void beforeMethod(JoinPoint joinPoint){
        String name = joinPoint.getSignature().getName();
        System.out.println(name+"方法开始执行...");
    }


    //后置通知
    @After(value = "@annotation(com.ruoyi.common.annotation.SysLog)")
    public void after(JoinPoint joinPoint){
        String name = joinPoint.getSignature().getName();
        System.out.println(name+"方法执行结束...");
    }
}
