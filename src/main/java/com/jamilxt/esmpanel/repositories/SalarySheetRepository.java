package com.jamilxt.esmpanel.repositories;

import com.jamilxt.esmpanel.model.SalarySheet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
@Transactional
public interface SalarySheetRepository extends JpaRepository<SalarySheet, Long> {

    List<SalarySheet> findAllByUserUsername(String username);

    @Query(value = "SELECT sum(amount) from tbl_salary_sheet", nativeQuery = true)
    Optional<Long> sumOfPaidAmount();

}
