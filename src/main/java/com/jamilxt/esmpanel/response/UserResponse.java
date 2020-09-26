package com.jamilxt.esmpanel.response;

public class UserResponse {

    private Long id;
    private String propic;
    private String username;
    private Integer grade;
    private Long salary;

    public UserResponse() {
    }

    public UserResponse(Long id, String propic, String username, Integer grade, Long salary) {
        this.id = id;
        this.propic = propic;
        this.username = username;
        this.grade = grade;
        this.salary = salary;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPropic() {
        return propic;
    }

    public void setPropic(String propic) {
        this.propic = propic;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public Long getSalary() {
        return salary;
    }

    public void setSalary(Long salary) {
        this.salary = salary;
    }

}
