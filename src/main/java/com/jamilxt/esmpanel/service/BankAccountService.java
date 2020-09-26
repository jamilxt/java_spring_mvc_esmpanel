package com.jamilxt.esmpanel.service;

import com.jamilxt.esmpanel.model.BankAccount;
import com.jamilxt.esmpanel.model.SalarySheet;
import com.jamilxt.esmpanel.model.User;
import com.jamilxt.esmpanel.repositories.BankAccountRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BankAccountService {

    final BankAccountRepository bankAccountRepository;

    final SalarySheetService salarySheetService;

    @Autowired
    public BankAccountService(BankAccountRepository bankAccountRepository, SalarySheetService salarySheetService) {
        this.bankAccountRepository = bankAccountRepository;
        this.salarySheetService = salarySheetService;
    }

    public void save(BankAccount bankAccount) {
        bankAccountRepository.save(bankAccount);
    }

    public long getBankBalanceByUsername(String username) {
        return bankAccountRepository.findByUserUsername(username).getCurrentBalance();
    }

    public BankAccount findByUsername(String username) {
        return bankAccountRepository.findByUserUsername(username);
    }

    public void updateBankDetails(BankAccount bankAccount) {
        var newBankDetails = bankAccountRepository.findByUserUsername(bankAccount.getUser().getUsername());
        BeanUtils.copyProperties(bankAccount, newBankDetails);
        bankAccountRepository.save(newBankDetails);
    }

    public String paySalaryToAUser(User user, Long amount) {
        if (getBankBalanceByUsername("admin") < amount) {
            return "Please recharge your account";
        } else {
            var newBankDetails = bankAccountRepository.findByUserUsername(user.getUsername());
            // add new amount
            newBankDetails.setCurrentBalance(newBankDetails.getCurrentBalance() + amount);
            // deduct from company
            deductAmountFromCompany(amount);
            bankAccountRepository.save(newBankDetails);

            SalarySheet salarySheet = new SalarySheet();
            salarySheet.setUser(user);
            salarySheet.setAmount(amount);

            salarySheetService.insertEntry(salarySheet);
            return "Salary has been paid successful!";
        }
    }

    public void deductAmountFromCompany(Long amount) {
        var companyBankDetails = bankAccountRepository.findByUserUsername("admin");
        companyBankDetails.setCurrentBalance(companyBankDetails.getCurrentBalance() - amount);
        bankAccountRepository.save(companyBankDetails);
    }

    public long rechargeAmountOnCompany(Long amount) {
        var companyBankDetails = bankAccountRepository.findByUserUsername("admin");
        companyBankDetails.setCurrentBalance(companyBankDetails.getCurrentBalance() + amount);
        bankAccountRepository.save(companyBankDetails);
        return companyBankDetails.getCurrentBalance();
    }

}
