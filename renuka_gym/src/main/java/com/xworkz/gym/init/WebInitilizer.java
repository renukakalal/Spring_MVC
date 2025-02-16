package com.xworkz.gym.init;

import com.xworkz.gym.configuration.AdminConfiguration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebInitilizer extends AbstractAnnotationConfigDispatcherServletInitializer implements WebMvcConfigurer {
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[0];
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[ ]{AdminConfiguration.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[ ]{"/"};
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }
}
