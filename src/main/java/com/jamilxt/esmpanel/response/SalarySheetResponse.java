package com.jamilxt.esmpanel.response;

public class SalarySheetResponse {

    private Long id;
    private String payDate;
    private String username;
    private Long amount;

    public SalarySheetResponse() {
    }

    public SalarySheetResponse(Long id, String payDate, String username, Long amount) {
        this.id = id;
        this.payDate = payDate;
        this.username = username;
        this.amount = amount;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Long getAmount() {
        return amount;
    }

    public void setAmount(Long amount) {
        this.amount = amount;
    }

}
