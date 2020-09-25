package com.jamilxt.esmpanel;

import com.jamilxt.esmpanel.config.security.CustomAuthSuccessHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@ComponentScan(basePackages = {
        "com.jamilxt.esmpanel.service",
        "com.jamilxt.esmpanel.config.persistence",
        "com.jamilxt.esmpanel.config.security" })
public class RootConfig {

    @Bean
    GlobalExceptionHandler globalExceptionHandler() {
        return new GlobalExceptionHandler();
    }

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public CustomAuthSuccessHandler authSuccessHandler() {
        return new CustomAuthSuccessHandler();
    }

    @Bean
    public CommonsMultipartResolver commonsMultipartResolver() {
        return new CommonsMultipartResolver();
    }

}
