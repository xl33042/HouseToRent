package com.example.housetorentrearend.service.wx;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.housetorentrearend.entity.PersonInfoVO;

public interface PersonInfoService extends IService<PersonInfoVO> {
    PersonInfoVO verifyLoginOrRegistration(String mobile, String password);
}
