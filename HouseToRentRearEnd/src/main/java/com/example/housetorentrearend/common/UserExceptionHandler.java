package com.example.housetorentrearend.common;


import org.apache.shiro.authz.AuthorizationException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

@RestControllerAdvice
public class UserExceptionHandler {

    private static final Logger log = Logger.getLogger(UserExceptionHandler.class.getName());


    /**
     * 权限异常处理
     */
    @ExceptionHandler(AuthorizationException.class)
    public Object handleAuthorizationException(HttpServletRequest request, AuthorizationException e) {
        if (isAjaxRequest(request)) {
            // 如果是 Ajax 请求，则返回 JSON 数据
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("error", "Unauthorized");
            return errorResponse;
        } else {
            // 如果是普通请求，则跳转到错误页面
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.setViewName("/shiro/error");
            return modelAndView;
        }
    }

    /**
     * 判断请求是否为 Ajax 请求
     */
    private boolean isAjaxRequest(HttpServletRequest request) {
        return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
    }


}
