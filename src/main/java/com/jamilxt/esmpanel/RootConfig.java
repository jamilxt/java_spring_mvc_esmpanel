package com.jamilxt.esmpanel;

import com.jamilxt.esmpanel.config.security.CustomAuthSuccessHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

/*
 *
 * TODO:
 *   1. soft delete (c)
 *   2. multiple authorities/roles for a user (c)
 *   3. profiling - dev/prod (c)
 *   4. deployment to heroku (c)
 *   5. add user (c), change password, change role
 *   6. image upload (c), user details
 *   7. SMTP setup
 *   8. change password, forgot password
 *   9. api for searching (c)
 *  10. Jquery Date Plugin in form (c)
 *  11. Soft Delete for user
 *  12. Pagination (c)
 *  13. Sort by (c)
 *  14. Search
 *  15. Use AWS S3 Bucket to upload files
 *  16. single page view
 *  17. Logged In User's Details in Session
 *
 *
 *
 *
 * question:
 * 1) adding date to db
 * 2) redirecting to index if user is already logged in
 * */

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
