package com.example.housetorentrearend.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringBootConfiguration;

/*
* 项目启动后,打开默认浏览器，并跳转到指定页面
*
* */
@SpringBootConfiguration
public class AutoStartProjectInDefaultBrowser implements CommandLineRunner {
    @Value("${server.port}")
    private String port;

    @Override
    public void run(String ... args) throws Exception {
        try {
            Runtime.getRuntime().exec("cmd /c start http://localhost:" + port + "/MySpringboot/login2/index");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}