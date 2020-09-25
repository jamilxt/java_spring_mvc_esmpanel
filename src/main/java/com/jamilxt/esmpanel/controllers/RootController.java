package com.jamilxt.esmpanel.controllers;

import com.jamilxt.esmpanel.model.Authority;
import com.jamilxt.esmpanel.model.BankAccount;
import com.jamilxt.esmpanel.model.Setting;
import com.jamilxt.esmpanel.model.User;
import com.jamilxt.esmpanel.service.*;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashSet;
import java.util.Set;

@Controller
public class RootController extends BaseService {

    private final UserService userService;
    private final AuthorityService authorityService;
    private final PasswordEncoder passwordEncoder;
    private final SettingService settingService;
    private final BankAccountService bankAccountService;
    private final SalarySheetService salarySheetService;

    public RootController(UserService userService, PasswordEncoder passwordEncoder, AuthorityService authorityService, SettingService settingService, BankAccountService bankAccountService, SalarySheetService salarySheetService) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.authorityService = authorityService;
        this.settingService = settingService;
        this.bankAccountService = bankAccountService;
        this.salarySheetService = salarySheetService;
    }

    @GetMapping("/")
    public String root(Model model) {
        model.addAttribute("pageTitle", "Dashboard");
        model.addAttribute("authUser", getLoggedInUser());
        model.addAttribute("totalEmployee", userService.totalEmployee());
        model.addAttribute("balance", bankAccountService.getBankBalanceByUsername(getLoggedInUser().getUsername()));
        model.addAttribute("totalPaidAmount", salarySheetService.getTotalPaidAmount());
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
        // Admin
        if (userService.findByUsername("admin").isEmpty()) {
            var admin = new User();
            admin.setUsername("admin");
            admin.setPassword(passwordEncoder.encode("secret"));
            admin.setFullName("Admin");
            admin.setEmail("admin@gmail.com");
            admin.setEnabled(true);
            Set<Authority> adminAuthorities = new HashSet<>();
            adminAuthorities.add(authorityService.findByRoleName("ROLE_ADMIN"));
            admin.setAuthorities(adminAuthorities);
            User savedAdmin = userService.save(admin);

            BankAccount bankAccount = new BankAccount();
            bankAccount.setAccountName("ESMPANEL LTD.");
            bankAccount.setAccountNumber(RandomStringUtils.randomNumeric(10));
            bankAccount.setAccountType("Savings");
            bankAccount.setCurrentBalance(50000000);
            bankAccount.setBankName("Janata Bank Ltd.");
            bankAccount.setBranchName("Uttara");
            bankAccount.setUser(savedAdmin);
            bankAccountService.save(bankAccount);

        }


        // Employee 1
        if (userService.findByUsername("employee1").isEmpty()) {
            var employee = new User();
            employee.setUsername("employee1");
            employee.setPassword(passwordEncoder.encode("secret"));
            employee.setFullName("Employee1");
            employee.setEmail("employee1@gmail.com");
            employee.setEnabled(true);
            Set<Authority> employeeAuthorities = new HashSet<>();
            employeeAuthorities.add(authorityService.findByRoleName("ROLE_EMPLOYEE"));
            employee.setAuthorities(employeeAuthorities);
            User savedUser = userService.save(employee);

            BankAccount bankAccount1 = new BankAccount();
            bankAccount1.setUser(savedUser);
            bankAccountService.save(bankAccount1);
        }
    }

    private void setGlobalSetting() {
        if (settingService.findByAttribute("lowest_grade_basic_salary").isEmpty()) {
            var lowestGradeBasicSalarySetting = new Setting();
            lowestGradeBasicSalarySetting.setAttribute("lowest_grade_basic_salary");
            lowestGradeBasicSalarySetting.setValue("10000");
            settingService.save(lowestGradeBasicSalarySetting);
        }
    }

}
