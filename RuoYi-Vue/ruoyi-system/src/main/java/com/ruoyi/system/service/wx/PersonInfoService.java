package com.ruoyi.system.service.wx;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.system.domain.vo.PersonInfoVO;


public interface PersonInfoService extends IService<PersonInfoVO> {
    PersonInfoVO verifyLoginOrRegistration(String mobile, String password);
}
