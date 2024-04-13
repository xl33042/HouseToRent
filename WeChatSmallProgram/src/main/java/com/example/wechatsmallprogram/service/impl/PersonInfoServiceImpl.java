package com.example.wechatsmallprogram.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.example.wechatsmallprogram.entity.PersonInfoVO;
import com.example.wechatsmallprogram.mapper.PersonInfoMapper;
import com.example.wechatsmallprogram.service.PersonInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonInfoServiceImpl extends ServiceImpl<PersonInfoMapper, PersonInfoVO> implements PersonInfoService {


    @Autowired
    PersonInfoMapper personInfoMapper;


    @Override
    public PersonInfoVO verifyLoginOrRegistration(String mobile, String password) {
        QueryWrapper<PersonInfoVO> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("mobile",mobile);
        PersonInfoVO personInfoVO = personInfoMapper.selectOne(queryWrapper);
        if (personInfoVO == null){
            personInfoVO = new PersonInfoVO();
            personInfoVO.setMobile(mobile);
            personInfoVO.setPassword(password);
//            saveOrUpdate(personInfoVO);
            personInfoMapper.insert(personInfoVO);

            return personInfoVO;
        }else {
            if(personInfoVO.getPersonId().equals(password)){
                return personInfoVO;
            }else {
                return null;
            }
        }
    }
}
