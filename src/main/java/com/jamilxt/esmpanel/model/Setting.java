package com.jamilxt.esmpanel.model;

import javax.persistence.*;

@Entity
@Table(name = "tbl_setting")
public class Setting {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id", nullable = false)
    private long id;

    @Column(name = "lowest_salary", nullable = false)
    private String lowest_salary;

}
