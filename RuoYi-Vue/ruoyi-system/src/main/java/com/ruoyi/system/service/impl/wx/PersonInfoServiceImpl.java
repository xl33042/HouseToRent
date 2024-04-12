package com.ruoyi.system.service.impl.wx;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;


import com.ruoyi.system.domain.vo.PersonInfoVO;
import com.ruoyi.system.mapper.wx.PersonInfoMapper;
import com.ruoyi.system.service.wx.PersonInfoService;
import org.springframework.stereotype.Service;

@Service
public class PersonInfoServiceImpl extends ServiceImpl<PersonInfoMapper, PersonInfoVO> implements PersonInfoService {

    private PersonInfoMapper personInfoMapper;

    @Override
    public PersonInfoVO verifyLoginOrRegistration(String mobile, String password) {
        QueryWrapper<PersonInfoVO> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("mobile",mobile);
        PersonInfoVO personInfoVO = queryWrapper.getEntity();
        if (personInfoMapper == null){
            personInfoVO = new PersonInfoVO();
            personInfoVO.setMobile(mobile);
            personInfoVO.setPassword(password);
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
