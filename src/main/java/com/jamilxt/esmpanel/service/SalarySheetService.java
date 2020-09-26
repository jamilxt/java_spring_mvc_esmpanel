package com.jamilxt.esmpanel.service;

import com.jamilxt.esmpanel.model.SalarySheet;
import com.jamilxt.esmpanel.repositories.SalarySheetRepository;
import com.jamilxt.esmpanel.response.SalarySheetResponse;
import org.ocpsoft.prettytime.PrettyTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class SalarySheetService {

    private final SalarySheetRepository salarySheetRepository;
    private final UserService userService;

    @Autowired
    public SalarySheetService(SalarySheetRepository salarySheetRepository, UserService userService) {
        this.salarySheetRepository = salarySheetRepository;
        this.userService = userService;
    }

    public List<SalarySheetResponse> findByUsername(String username) {
        List<SalarySheetResponse> salarySheetList = new ArrayList<>();

        for (SalarySheet salarySheet :
                salarySheetRepository.findAllByUserUsername(username)) {
            SalarySheetResponse salarySheetResponse = new SalarySheetResponse();
            salarySheetResponse.setId(salarySheet.getId());
            salarySheetResponse.setPayDate(new PrettyTime().format(new Date(Timestamp.valueOf(salarySheet.getPay_date()).getTime())));
            salarySheetResponse.setUsername(salarySheet.getUser().getUsername());
            salarySheetResponse.setAmount(salarySheet.getAmount());
            salarySheetList.add(salarySheetResponse);
        }
        return salarySheetList;
    }

    public List<SalarySheetResponse> findAll() {
        List<SalarySheetResponse> salarySheetList = new ArrayList<>();
        for (SalarySheet salarySheet :
                salarySheetRepository.findAll()) {
            SalarySheetResponse salarySheetResponse = new SalarySheetResponse();
            salarySheetResponse.setId(salarySheet.getId());
            salarySheetResponse.setPayDate(new PrettyTime().format(new Date(Timestamp.valueOf(salarySheet.getPay_date()).getTime())));
            salarySheetResponse.setUsername(salarySheet.getUser().getUsername());
            salarySheetResponse.setAmount(salarySheet.getAmount());
            salarySheetList.add(salarySheetResponse);
        }
        return salarySheetList;
    }

    public long getTotalPaidAmount() {
        if (salarySheetRepository.sumOfPaidAmount().isEmpty()) {
            return 0;
        }
        return Long.parseLong(salarySheetRepository.sumOfPaidAmount().get().toString());
    }


}
