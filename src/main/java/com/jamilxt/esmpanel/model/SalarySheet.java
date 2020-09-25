package com.jamilxt.esmpanel.model;

import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "tbl_salary_sheet")
public class SalarySheet {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id", nullable = false)
    private long id;

    @Column(name = "pay_date")
    @CreationTimestamp
    private LocalDateTime pay_date;

    @Column(name = "amount")
    private long amount = 0;

    @OneToOne
    @JoinColumn(name = "to_user_id")
    private User user;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public LocalDateTime getPay_date() {
        return pay_date;
    }

    public void setPay_date(LocalDateTime pay_date) {
        this.pay_date = pay_date;
    }

    public long getAmount() {
        return amount;
    }

    public void setAmount(long amount) {
        this.amount = amount;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
