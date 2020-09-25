package com.jamilxt.esmpanel.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {

    private final PasswordEncoder passwordEncoder;

    private final UserDetailsService userDetailsService;
    private final CustomAuthSuccessHandler customAuthSuccessHandler;

    @Autowired
    public WebSecurityConfiguration(PasswordEncoder passwordEncoder, UserDetailsService userDetailsService, CustomAuthSuccessHandler customAuthSuccessHandler) {
        this.passwordEncoder = passwordEncoder;
        this.userDetailsService = userDetailsService;
        this.customAuthSuccessHandler = customAuthSuccessHandler;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // We are disabling CSRF so that our forms don't complain for a CSRF token.
        // Beware that it can create a security vulnerability
        http.csrf().disable();

        // We are permitting all static resources to be accessed publicly
        http
                .authorizeRequests()
                .antMatchers("/images/**", "/css/**", "/js/**", "/accounts/login", "/accounts/emailsignup", "/post/**", "/api/**").permitAll()
                .and()
                .authorizeRequests()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/login") // Login page will be accessed through this endpoint. We will create a controller method for this.
                .loginProcessingUrl("/login-processing") // This endpoint will be mapped internally. This URL will be our Login form post action.
                .permitAll() // We re permitting all for login page
                .usernameParameter("username")
                .passwordParameter("password")
                .successHandler(customAuthSuccessHandler)
                .defaultSuccessUrl("/", true) // If the login is successful, user will be redirected to this URL.
                .failureUrl("/login?error=true") // If the user fails to login, application will redirect the user to this endpoint
                .and()
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/")
                .and()
                .exceptionHandling() // Custom Access Denied Handling
                .accessDeniedHandler(new CustomAccessDeniedHandler());
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        super.configure(web);
    }

}