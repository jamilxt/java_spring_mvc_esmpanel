package com.jamilxt.esmpanel.repositories;

import com.jamilxt.esmpanel.model.Setting;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface SettingRepository extends JpaRepository<Setting, Long> {

    @Query(value = "select *" +
            " from tbl_setting s" +
            " where s.attribute_name like %:attribute% ", nativeQuery = true)
    Setting getSettingByAttribute(@Param("attribute") String attribute);

    Optional<Setting> findByAttribute(String attribute);

}
