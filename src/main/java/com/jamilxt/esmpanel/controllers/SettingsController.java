package com.jamilxt.esmpanel.controllers;

import com.jamilxt.esmpanel.model.Setting;
import com.jamilxt.esmpanel.service.BankAccountService;
import com.jamilxt.esmpanel.service.BaseService;
import com.jamilxt.esmpanel.service.SettingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class SettingsController extends BaseService {

    final BankAccountService bankAccountService;
    final SettingService settingService;

    public SettingsController(BankAccountService bankAccountService, SettingService settingService) {
        this.bankAccountService = bankAccountService;
        this.settingService = settingService;
    }

    @GetMapping("/settings/salary")
    public String getSettings(Model model, @ModelAttribute(name = "setting") Setting setting) {
        model.addAttribute("pageTitle", "Setting");
        model.addAttribute("authUser", getLoggedInUser());
        model.addAttribute("balance", bankAccountService.getBankBalanceByUsername(getLoggedInUser().getUsername()));
        model.addAttribute("fieldId", settingService.findByAttribute("lowest_grade_basic_salary").get().getId());
        model.addAttribute("attributeName", "lowest_grade_basic_salary");
        model.addAttribute("attributeValue", settingService.getLowestGradeBasicSalaryValue().toString());
        return "settings/salary-config";
    }

    @PostMapping("/settings/salary")
    public String setLowestBasicSalary(Model model, @ModelAttribute(name = "setting") Setting setting) {
        settingService.updateBasicSalaryOfLowestGrade(setting);
        model.addAttribute("message", "Updated successfully");
        return "redirect:/settings/salary";
    }


}
