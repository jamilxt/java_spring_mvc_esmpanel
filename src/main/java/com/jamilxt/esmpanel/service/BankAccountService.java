package com.jamilxt.esmpanel.service;

import com.jamilxt.esmpanel.model.BankAccount;
import com.jamilxt.esmpanel.repositories.BankAccountRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BankAccountService {

    final BankAccountRepository bankAccountRepository;

    @Autowired
    public BankAccountService(BankAccountRepository bankAccountRepository) {
        this.bankAccountRepository = bankAccountRepository;
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

}
