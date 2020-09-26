package com.jamilxt.esmpanel.service;

import com.jamilxt.esmpanel.model.Setting;
import com.jamilxt.esmpanel.repositories.SettingRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class SettingService {

    final SettingRepository settingRepository;

    public SettingService(SettingRepository settingRepository) {
        this.settingRepository = settingRepository;
    }

    public void save(Setting setting) {
        settingRepository.save(setting);
    }

    public Optional<Setting> findByAttribute(String attribute) {
        return settingRepository.findByAttribute(attribute);
    }

    public Long getLowestGradeBasicSalaryValue() {
        return Long.parseLong(settingRepository.getSettingByAttribute("lowest_grade_basic_salary").getValue());
    }

}
