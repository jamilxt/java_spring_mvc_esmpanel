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
            admin.setGrade(0);
            admin.setEnabled(true);
            Set<Authority> adminAuthorities = new HashSet<>();
            adminAuthorities.add(authorityService.findByRoleName("ROLE_ADMIN"));
            admin.setAuthorities(adminAuthorities);
            User savedAdmin = userService.save(admin);

            BankAccount bankAccount = new BankAccount();
            bankAccount.setAccountName("ESMPANEL LTD.");
            bankAccount.setAccountNumber(RandomStringUtils.randomNumeric(10));
            bankAccount.setAccountType("Savings");
            bankAccount.setCurrentBalance(50000000L);
            bankAccount.setBankName("Janata Bank Ltd.");
            bankAccount.setBranchName("Uttara");
            bankAccount.setUser(savedAdmin);
            bankAccountService.save(bankAccount);

        }

        // Employee 1 - Grade 1
        if (userService.findByUsername("employee1").isEmpty()) {
            var employee = new User();
            employee.setUsername("employee1");
            employee.setPassword(passwordEncoder.encode("secret"));
            employee.setFullName("Employee1");
            employee.setEmail("employee1@gmail.com");
            employee.setGrade(1);
            employee.setEnabled(true);
            Set<Authority> employeeAuthorities = new HashSet<>();
            employeeAuthorities.add(authorityService.findByRoleName("ROLE_EMPLOYEE"));
            employee.setAuthorities(employeeAuthorities);
            User savedUser = userService.save(employee);

            BankAccount bankAccount1 = new BankAccount();
            bankAccount1.setUser(savedUser);
            bankAccountService.save(bankAccount1);
        }

        // Employee 2 - Grade 2
        if (userService.findByUsername("employee2").isEmpty()) {
            var employee2 = new User();
            employee2.setUsername("employee2");
            employee2.setPassword(passwordEncoder.encode("secret"));
            employee2.setFullName("Employee2");
            employee2.setEmail("employee2@gmail.com");
            employee2.setGrade(2);
            employee2.setEnabled(true);
            Set<Authority> employeeAuthorities = new HashSet<>();
            employeeAuthorities.add(authorityService.findByRoleName("ROLE_EMPLOYEE"));
            employee2.setAuthorities(employeeAuthorities);
            User savedUser = userService.save(employee2);

            BankAccount employee2BankAccount = new BankAccount();
            employee2BankAccount.setUser(savedUser);
            bankAccountService.save(employee2BankAccount);
        }

        // Employee 3 - Grade 3
        if (userService.findByUsername("employee3").isEmpty()) {
            var employee3 = new User();
            employee3.setUsername("employee3");
            employee3.setPassword(passwordEncoder.encode("secret"));
            employee3.setFullName("Employee3");
            employee3.setEmail("employee3@gmail.com");
            employee3.setGrade(3);
            employee3.setEnabled(true);
            Set<Authority> employeeAuthorities = new HashSet<>();
            employeeAuthorities.add(authorityService.findByRoleName("ROLE_EMPLOYEE"));
            employee3.setAuthorities(employeeAuthorities);
            User savedUser = userService.save(employee3);

            BankAccount employee3BankAccount = new BankAccount();
            employee3BankAccount.setUser(savedUser);
            bankAccountService.save(employee3BankAccount);
        }

        // Employee 4 - Grade 3
        if (userService.findByUsername("employee4").isEmpty()) {
            var employee4 = new User();
            employee4.setUsername("employee4");
            employee4.setPassword(passwordEncoder.encode("secret"));
            employee4.setFullName("Employee4");
            employee4.setEmail("employee4@gmail.com");
            employee4.setGrade(3);
            employee4.setEnabled(true);
            Set<Authority> employeeAuthorities = new HashSet<>();
            employeeAuthorities.add(authorityService.findByRoleName("ROLE_EMPLOYEE"));
            employee4.setAuthorities(employeeAuthorities);
            User savedUser = userService.save(employee4);

            BankAccount employee4BankAccount = new BankAccount();
            employee4BankAccount.setUser(savedUser);
            bankAccountService.save(employee4BankAccount);
        }

        // Employee 5 - Grade 4
        if (userService.findByUsername("employee5").isEmpty()) {
            var employee5 = new User();
            employee5.setUsername("employee5");
            employee5.setPassword(passwordEncoder.encode("secret"));
            employee5.setFullName("Employee5");
            employee5.setEmail("employee5@gmail.com");
            employee5.setGrade(4);
            employee5.setEnabled(true);
            Set<Authority> employeeAuthorities = new HashSet<>();
            employeeAuthorities.add(authorityService.findByRoleName("ROLE_EMPLOYEE"));
            employee5.setAuthorities(employeeAuthorities);
            User savedUser = userService.save(employee5);

            BankAccount employee5BankAccount = new BankAccount();
            employee5BankAccount.setUser(savedUser);
            bankAccountService.save(employee5BankAccount);
        }

        // Employee 6 - Grade 4
        if (userService.findByUsername("employee6").isEmpty()) {
            var employee6 = new User();
            employee6.setUsername("employee6");
            employee6.setPassword(passwordEncoder.encode("secret"));
            employee6.setFullName("Employee6");
            employee6.setEmail("employee6@gmail.com");
            employee6.setGrade(4);
            employee6.setEnabled(true);
            Set<Authority> employeeAuthorities = new HashSet<>();
            employeeAuthorities.add(authorityService.findByRoleName("ROLE_EMPLOYEE"));
            employee6.setAuthorities(employeeAuthorities);
            User savedUser = userService.save(employee6);

            BankAccount employee6BankAccount = new BankAccount();
            employee6BankAccount.setUser(savedUser);
            bankAccountService.save(employee6BankAccount);
        }

        // Employee 7 - Grade 5
        if (userService.findByUsername("employee7").isEmpty()) {
            var employee7 = new User();
            employee7.setUsername("employee7");
            employee7.setPassword(passwordEncoder.encode("secret"));
            employee7.setFullName("Employee7");
            employee7.setEmail("employee7@gmail.com");
            employee7.setGrade(5);
            employee7.setEnabled(true);
            Set<Authority> employeeAuthorities = new HashSet<>();
            employeeAuthorities.add(authorityService.findByRoleName("ROLE_EMPLOYEE"));
            employee7.setAuthorities(employeeAuthorities);
            User savedUser = userService.save(employee7);

            BankAccount employee7BankAccount = new BankAccount();
            employee7BankAccount.setUser(savedUser);
            bankAccountService.save(employee7BankAccount);
        }

        // Employee 8 - Grade 5
        if (userService.findByUsername("employee8").isEmpty()) {
            var employee8 = new User();
            employee8.setUsername("employee8");
            employee8.setPassword(passwordEncoder.encode("secret"));
            employee8.setFullName("Employee8");
            employee8.setEmail("employee8@gmail.com");
            employee8.setGrade(5);
            employee8.setEnabled(true);
            Set<Authority> employeeAuthorities = new HashSet<>();
            employeeAuthorities.add(authorityService.findByRoleName("ROLE_EMPLOYEE"));
            employee8.setAuthorities(employeeAuthorities);
            User savedUser = userService.save(employee8);

            BankAccount employee8BankAccount = new BankAccount();
            employee8BankAccount.setUser(savedUser);
            bankAccountService.save(employee8BankAccount);
        }

        // Employee 9 - Grade 6
        if (userService.findByUsername("employee9").isEmpty()) {
            var employee9 = new User();
            employee9.setUsername("employee9");
            employee9.setPassword(passwordEncoder.encode("secret"));
            employee9.setFullName("Employee9");
            employee9.setEmail("employee9@gmail.com");
            employee9.setGrade(6);
            employee9.setEnabled(true);
            Set<Authority> employeeAuthorities = new HashSet<>();
            employeeAuthorities.add(authorityService.findByRoleName("ROLE_EMPLOYEE"));
            employee9.setAuthorities(employeeAuthorities);
            User savedUser = userService.save(employee9);

            BankAccount employee9BankAccount = new BankAccount();
            employee9BankAccount.setUser(savedUser);
            bankAccountService.save(employee9BankAccount);
        }

        // Employee 10 - Grade 6
        if (userService.findByUsername("employee10").isEmpty()) {
            var employee10 = new User();
            employee10.setUsername("employee10");
            employee10.setPassword(passwordEncoder.encode("secret"));
            employee10.setFullName("Employee10");
            employee10.setEmail("employee10@gmail.com");
            employee10.setGrade(6);
            employee10.setEnabled(true);
            Set<Authority> employeeAuthorities = new HashSet<>();
            employeeAuthorities.add(authorityService.findByRoleName("ROLE_EMPLOYEE"));
            employee10.setAuthorities(employeeAuthorities);
            User savedUser = userService.save(employee10);

            BankAccount employee10BankAccount = new BankAccount();
            employee10BankAccount.setUser(savedUser);
            bankAccountService.save(employee10BankAccount);
        }
    }

    private void setGlobalSetting() {
        if (settingService.findByAttribute("lowest_grade_basic_salary") == null) {
            var lowestGradeBasicSalarySetting = new Setting();
            lowestGradeBasicSalarySetting.setAttribute("lowest_grade_basic_salary");
            lowestGradeBasicSalarySetting.setValue("10000");
            settingService.save(lowestGradeBasicSalarySetting);
        }
    }

}
