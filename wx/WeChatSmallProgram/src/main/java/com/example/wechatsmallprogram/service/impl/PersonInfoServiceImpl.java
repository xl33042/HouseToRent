package com.example.wechatsmallprogram.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.example.wechatsmallprogram.entity.PersonInfoVO;
import com.example.wechatsmallprogram.mapper.PersonInfoMapper;
import com.example.wechatsmallprogram.service.PersonInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

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
            personInfoVO.setCreaterTime(new Date());
            personInfoVO.setState(2);
            personInfoMapper.insert(personInfoVO);
            personInfoVO = personInfoMapper.selectOne(queryWrapper);
            return personInfoVO;
        }else {
            if(personInfoVO.getPassword().equals(password)){
                return personInfoVO;
            }else {
                return null;
            }
        }
    }

    @Override
    public PersonInfoVO userData(int id) {
        return personInfoMapper.selectById(id);
    }

    @Override
    public void updateUserData(PersonInfoVO personInfoVO) {

    }
}
