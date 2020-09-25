package com.jamilxt.esmpanel.model;

import javax.persistence.*;

@Entity
@Table(name = "tbl_setting")
public class Setting {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id", nullable = false)
    private long id;

    @Column(name = "attribute_name")
    private String attribute;

    @Column(name = "attribute_value")
    private String value;

    public Setting() {
    }

    public Setting(long id, String attribute, String value) {
        this.id = id;
        this.attribute = attribute;
        this.value = value;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
