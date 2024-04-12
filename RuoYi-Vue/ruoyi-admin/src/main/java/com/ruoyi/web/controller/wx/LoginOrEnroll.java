package com.ruoyi.web.controller.wx;




import com.ruoyi.common.core.domain.R;
import com.ruoyi.system.domain.vo.PersonInfoVO;
import com.ruoyi.system.service.wx.PersonInfoService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/wx/LoginOrEnroll")
public class LoginOrEnroll {

    private PersonInfoService personInfoService;


    @PostMapping("/verify")
    public R verify(@RequestBody PersonInfoVO personInfoVO){

        if (personInfoVO.getMobile().matches("^1[3-9]\\d{9}$")){
            return R.fail("手机号格式错误");
        } else if (personInfoVO.getPassword().matches("^(?=.*[a-zA-Z])(?=.*\\d).{10,}$\n")) {
            return R.fail("密码格式错误（必须要字母和数字并且一共不能少于10位数的正则表达式）");
        }

        personInfoVO = personInfoService.verifyLoginOrRegistration(personInfoVO.getMobile(),personInfoVO.getPassword());
        if (personInfoVO==null){
            return R.fail("您的手机号或密码有误");
        }
        return R.ok(personInfoVO);
    }
}
