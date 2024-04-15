package com.example.wechatsmallprogram.controller;


import cn.hutool.core.util.IdUtil;
import com.example.wechatsmallprogram.common.LoginValidation;
import com.example.wechatsmallprogram.common.R;
import com.example.wechatsmallprogram.entity.PersonInfoVO;
import com.example.wechatsmallprogram.service.PersonInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/tenantOperation")
public class TenantOperation {

    public final static Map<String, PersonInfoVO> Users = new HashMap<>();

    @Autowired
    private PersonInfoService personInfoService;


    @PostMapping("/loginOrRegisterValidation")
    public R loginOrRegisterValidation(@RequestBody PersonInfoVO personInfoVO){

        if (!personInfoVO.getMobile().matches("^1[3-9]\\d{9}$")){
            return R.ok(LoginValidation.MOBILE_ERROR());
        } else if (!personInfoVO.getPassword().matches("^(?=.*[a-zA-Z])(?=.*\\d)[a-zA-Z\\d]{10}$")) {
            return R.ok(LoginValidation.PASSWORD_ERROR());
        }


        personInfoVO = personInfoService.verifyLoginOrRegistration(personInfoVO.getMobile(),personInfoVO.getPassword());
        if(personInfoVO==null){
            return R.ok(LoginValidation.INCORRECT_CREDENTIALS());
        }


        if(personInfoVO.getState() == 1){
            return R.ok(LoginValidation.ACCOUNT_IS_DISABLED());
        }else {
            boolean pd = false;
            String token = null;
            for (String s : Users.keySet()) {
                if (Users.get(s).getPersonId() == personInfoVO.getPersonId()){
                    token = s;
                    pd = true;
                }
            }
            if(!pd){
                token = IdUtil.simpleUUID();
                Users.put(token,personInfoVO);
            }
            return R.ok(LoginValidation.SUCCESS(token));
        }


    }


    @PostMapping("/personalCenterData")
    public R personalCenterData(@RequestBody String token){

        int id = Users.get(token).getPersonId();

        return R.ok(personInfoService.getById(id));
    }


    @PostMapping("/changeUserData")
    public R ChangeUserData(@RequestBody PersonInfoVO personInfoVO,@RequestBody String token){


        return R.ok(token);
    }

}
