package com.example.housetorentrearend.controller.wx;


import com.example.housetorentrearend.entity.wx.PhoneSms;
import com.github.qcloudsms.SmsSingleSender;
import com.github.qcloudsms.SmsSingleSenderResult;
import com.github.qcloudsms.httpclient.HTTPException;
import org.json.JSONException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;


@RestController
@RequestMapping("/wx/LoginOrRegister")
public class LoginOrRegister {


    @PostMapping("/sendSms")
    public int sendSms(@RequestBody PhoneSms phoneSms){
        int appid = 0;
        String appkey = "";
        int templateId = 0;
        String smsmSign = "";
        try {
            String[] params = {phoneSms.getCode(), String.valueOf(phoneSms.getMin())};
            SmsSingleSender smsSingleSender = new SmsSingleSender(appid, appkey);
            SmsSingleSenderResult result = smsSingleSender.sendWithParam("86",phoneSms.getPhoneNumber(),templateId,params,smsmSign,"","");
            System.out.println(result);
        }catch (HTTPException e){
            e.printStackTrace();
        }catch (JSONException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }


        return 1;
    }


}
