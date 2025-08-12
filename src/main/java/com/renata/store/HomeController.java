package com.renata.store;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller //use this class as a web controller
public class HomeController {
    @Value("${spring.application.name}")
    private String appName;


    @RequestMapping("/")
    public String index(){
        System.out.println("appName:" + appName);
        return "index.html";
    }
}
