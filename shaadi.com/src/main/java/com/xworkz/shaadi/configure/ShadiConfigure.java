package com.xworkz.shaadi.configure;


import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan("com.xworkz.shaadi")
public class ShadiConfigure{
    public ShadiConfigure()
    {
        System.out.println("saadiconfigure is running");
    }


}
