package com.xworkz.gym.configuration;


import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
@EnableWebMvc
@Configuration
@Slf4j
@ComponentScan("com.xworkz.gym")

public class AdminConfiguration {

    public AdminConfiguration()
    {

    }
    @Bean
    public LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean() {

        LocalContainerEntityManagerFactoryBean bean = new LocalContainerEntityManagerFactoryBean();
        log.info("log module is running ");
        bean.setPackagesToScan("com.xworkz.gym.entity");
        bean.setDataSource(dataSource());
        bean.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
        return bean;

    }

    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUsername("root");
        dataSource.setPassword("Xworkzodc@123");
        dataSource.setUrl("jdbc:mysql://localhost:3306/gym");
        return dataSource;

    }

    @Bean
    public ViewResolver onView() {
        return new InternalResourceViewResolver("/", ".jsp");
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver commonsMultipartResolver() {
        int sizeofimg = 5 * 1024 * 1024;

        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
        commonsMultipartResolver.setMaxUploadSize(sizeofimg);
        commonsMultipartResolver.setMaxInMemorySize(sizeofimg);

        return commonsMultipartResolver;
    }


}
