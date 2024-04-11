package com.example.housetorentrearend.service.impl.wx;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.housetorentrearend.dao.wx.PersonInfoDao;
import com.example.housetorentrearend.entity.PersonInfoVO;
import com.example.housetorentrearend.service.wx.PersonInfoService;
import org.springframework.stereotype.Service;

@Service
public class PersonInfoServiceImpl extends ServiceImpl<PersonInfoDao, PersonInfoVO> implements PersonInfoService {

    private PersonInfoDao personInfoDao;

    @Override
    public PersonInfoVO verifyLoginOrRegistration(String mobile, String password) {
        QueryWrapper<PersonInfoVO> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("mobile",mobile);
        PersonInfoVO personInfoVO = queryWrapper.getEntity();
        if (personInfoDao == null){
            personInfoVO = new PersonInfoVO();
            personInfoVO.setMobile(mobile);
            personInfoVO.setPassword(password);
            personInfoDao.insert(personInfoVO);
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
