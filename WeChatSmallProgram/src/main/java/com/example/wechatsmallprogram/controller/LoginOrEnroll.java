package com.example.wechatsmallprogram.controller;



import com.example.wechatsmallprogram.common.R;
import com.example.wechatsmallprogram.entity.PersonInfoVO;
import com.example.wechatsmallprogram.service.PersonInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/LoginOrEnroll")
public class LoginOrEnroll {


    @Autowired
    private PersonInfoService personInfoService;


    @PostMapping("/verify")
    public R verify(@RequestBody PersonInfoVO personInfoVO){

        if (!personInfoVO.getMobile().matches("^1[3-9]\\d{9}$")){
            return R.error("手机号格式错误");
        } else if (!personInfoVO.getPassword().matches("^(?=.*[a-zA-Z])(?=.*\\d)[a-zA-Z\\d]{10}$")) {
            return R.error("密码格式错误（必须要字母和数字并且一共不能少于10位数的正则表达式）");
        }

        try{
            personInfoVO = personInfoService.verifyLoginOrRegistration(personInfoVO.getMobile(),personInfoVO.getPassword());
        }catch (NullPointerException n){
            return R.error("您的手机号或密码有误");
        }


        return R.ok(personInfoVO);
    }
}