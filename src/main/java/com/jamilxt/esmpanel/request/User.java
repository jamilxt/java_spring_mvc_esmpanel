package com.jamilxt.esmpanel.request;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

public class User implements Serializable {
    private String username;
    private String password;
    private List<String> authorityNames;
    private String fullName;
    private String email;
    private String gender;
    private LocalDate dob;
    private Boolean active = true;
    private String propic = "default.png";

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<String> getAuthorityNames() {
        return authorityNames;
    }

    public void setAuthorityNames(List<String> authorityNames) {
        this.authorityNames = authorityNames;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public String getPropic() {
        return propic;
    }

    public void setPropic(String propic) {
        this.propic = propic;
    }
}
