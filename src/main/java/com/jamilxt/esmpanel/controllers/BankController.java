package com.jamilxt.esmpanel.controllers;

import com.jamilxt.esmpanel.model.BankAccount;
import com.jamilxt.esmpanel.service.BankAccountService;
import com.jamilxt.esmpanel.service.BaseService;
import com.jamilxt.esmpanel.service.SettingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BankController extends BaseService {

    final BankAccountService bankAccountService;
    final SettingService settingService;

    public BankController(BankAccountService bankAccountService, SettingService settingService) {
        this.bankAccountService = bankAccountService;
        this.settingService = settingService;
    }

    // Bank
    @GetMapping("/settings/bank")
    public String getBankDetails(Model model, @ModelAttribute(name = "bankAccount") BankAccount bankAccount) {
        model.addAttribute("pageTitle", "Setting - Bank Details");
        model.addAttribute("authUser", getLoggedInUser());
        model.addAttribute("balance", bankAccountService.getBankBalanceByUsername(getLoggedInUser().getUsername()));

//        model.addAttribute("fieldId", settingService.findByAttribute("lowest_grade_basic_salary").get().getId());
//        model.addAttribute("attributeName", "lowest_grade_basic_salary");
//        model.addAttribute("attributeValue", settingService.getLowestGradeBasicSalaryValue().toString());

        model.addAttribute("bankAccount", bankAccountService.findByUsername(getLoggedInUser().getUsername()));
        return "settings/bank-details";
    }

    @PostMapping("/settings/bank")
    public String setBankDetails(Model model, @ModelAttribute(name = "bankAccount") BankAccount bankAccount) {
        bankAccount.setUser(getLoggedInUser());
        bankAccountService.updateBankDetails(bankAccount);
        model.addAttribute("message", "Updated successfully");
        return "redirect:/settings/bank";
    }

}
