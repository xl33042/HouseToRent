package com.example.housetorentrearend.shiro;


import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class ShiroConfig {

    @Bean
    public UserRealm userRealm(){
        return new UserRealm();
    }

    @Bean
    public DefaultWebSecurityManager securityManager(){
        DefaultWebSecurityManager defaultWebSecurityManager = new DefaultWebSecurityManager();
        defaultWebSecurityManager.setRealm(userRealm());
        return defaultWebSecurityManager;
    }

    @Bean
    public ShiroFilterFactoryBean shiroFilterFactoryBean(DefaultWebSecurityManager defaultWebSecurityManager){
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(defaultWebSecurityManager);

        //设置登录页面访问地址
        shiroFilterFactoryBean.setLoginUrl("/login2/index");
        //设置登录成功后的访问地址
        shiroFilterFactoryBean.setSuccessUrl("/login2/home");

        Map<String,String> map = new LinkedHashMap<>();
        // 有先后顺序

        map.put("/login2/index", "anon"); // 登录成功后的访问路径
        map.put("/login2/login", "anon"); // 登录操作
        map.put("/js/**", "anon"); // js文件路径
        map.put("/css/**", "anon"); // css文件路径
        map.put("/images/**", "anon"); // 图标文件路径
        map.put("doc.html","anon");
        map.put("/upload/**", "anon"); // 上传后的图片访问路径（MyMvcConfig类中配置的路径）
        map.put("/wx/**", "anon");

        map.put("/**", "authc"); // 进行身份认证后才能访问
        shiroFilterFactoryBean.setFilterChainDefinitionMap(map);
        return shiroFilterFactoryBean;
    }



    /**
     * 开启Shiro注解模式，可以在Controller中的方法上添加注解(@RequiresPermissions)
     * @param securityManager
     * @return
     */
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(@Qualifier("securityManager") DefaultSecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }
}
