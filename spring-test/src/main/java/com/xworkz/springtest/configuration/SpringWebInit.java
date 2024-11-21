package com.xworkz.springtest.configuration;

import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class SpringWebInit extends AbstractAnnotationConfigDispatcherServletInitializer implements WebMvcConfigurer {


    public SpringWebInit(){
        System.out.println("created SpringWebInit");
    }



    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[0];
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[0];
    }

    @Override
    protected String[] getServletMappings() {
        String[] urls={"/"};
            System.out.println("configured urls for dispatcherServlet");
        return new String[0];
    }


    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer){
        System.out.println("enable static handling by server itself");
        configurer.enable();
    }
}
