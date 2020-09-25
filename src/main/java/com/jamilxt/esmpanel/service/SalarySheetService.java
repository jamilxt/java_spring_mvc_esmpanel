package com.jamilxt.esmpanel.service;

import com.jamilxt.esmpanel.model.SalarySheet;
import com.jamilxt.esmpanel.repositories.SalarySheetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SalarySheetService {

    private final SalarySheetRepository salarySheetRepository;

    @Autowired
    public SalarySheetService(SalarySheetRepository salarySheetRepository) {
        this.salarySheetRepository = salarySheetRepository;
    }

    public List<SalarySheet> findByUsername(String username) {
        return salarySheetRepository.findAllByUserUsername(username);
    }

    public List<SalarySheet> findAll() {
        return salarySheetRepository.findAll();
    }

    public long getTotalPaidAmount() {
        if (salarySheetRepository.sumOfPaidAmount().isEmpty()) {
            return 0;
        }
        return Long.parseLong(salarySheetRepository.sumOfPaidAmount().toString());
    }


}
