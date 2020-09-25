package com.jamilxt.esmpanel.controllers;

import com.jamilxt.esmpanel.model.Authority;
import com.jamilxt.esmpanel.model.Setting;
import com.jamilxt.esmpanel.model.User;
import com.jamilxt.esmpanel.service.*;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Controller
public class RootController extends BaseService {

    private final UserService userService;
    private final AuthorityService authorityService;
    private final PasswordEncoder passwordEncoder;
    private final SettingService settingService;

    public RootController(UserService userService, PasswordEncoder passwordEncoder, AuthorityService authorityService, SettingService settingService) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.authorityService = authorityService;
        this.settingService = settingService;
    }

    @GetMapping("/")
    public String root(Model model) {
        model.addAttribute("pageTitle", "Dashboard");
        model.addAttribute("authUser", getLoggedInUser());
        model.addAttribute("totalEmployee", userService.totalEmployee());
        model.addAttribute("balance", settingService.getBalance());
        return "index";
    }

    @GetMapping("/login")
    public String login(Model model, @RequestParam(name = "error", required = false) String error) {
        generateRoles();
        generateUsers();
        setGlobalSetting();
        model.addAttribute("pageTitle", "Login");
        model.addAttribute("error", error);
        return "/accounts/login";
    }

    @GetMapping("/403")
    public String _403() {
        return "403";
    }

    private void generateRoles() {
        authorityService.create(new Authority(System.nanoTime(), "ROLE_ADMIN"));
        authorityService.create(new Authority(System.nanoTime(), "ROLE_EMPLOYEE"));
    }

    private void generateUsers() {
        if (userService.findByUsername("admin").isEmpty()) {
            var admin = new User();
            admin.setUsername("admin");
            admin.setPassword(passwordEncoder.encode("secret"));
            admin.setFullName("Admin");
            admin.setGender("M");
            admin.setEmail("admin@gmail.com");
            admin.setEnabled(true);
            admin.setDob(LocalDate.now());
            Set<Authority> adminAuthorities = new HashSet<>();
            adminAuthorities.add(authorityService.findByRoleName("ROLE_ADMIN"));
            admin.setAuthorities(adminAuthorities);
            userService.save(admin);
        }


        if (userService.findByUsername("employee").isEmpty()) {

            var employee = new User();
            employee.setUsername("employee");
            employee.setPassword(passwordEncoder.encode("secret"));
            employee.setFullName("Employee");
            employee.setGender("M");
            employee.setEmail("employee@gmail.com");
            employee.setEnabled(true);
            employee.setDob(LocalDate.now());
            Set<Authority> employeeAuthorities = new HashSet<>();
            employeeAuthorities.add(authorityService.findByRoleName("ROLE_EMPLOYEE"));
            employee.setAuthorities(employeeAuthorities);
            userService.save(employee);
        }
    }

    private void setGlobalSetting() {
        if (settingService.findByAttribute("balance").isEmpty()) {
            var balanceSetting = new Setting();
            balanceSetting.setAttribute("balance");
            balanceSetting.setValue("5000000");
            settingService.save(balanceSetting);
        }

        if (settingService.findByAttribute("lowest_grade_basic_salary").isEmpty()) {
            var lowestGradeBasicSalarySetting = new Setting();
            lowestGradeBasicSalarySetting.setAttribute("lowest_grade_basic_salary");
            lowestGradeBasicSalarySetting.setValue("10000");
            settingService.save(lowestGradeBasicSalarySetting);
        }
    }

}
