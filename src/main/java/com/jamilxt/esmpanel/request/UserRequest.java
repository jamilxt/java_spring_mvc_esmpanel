package com.jamilxt.esmpanel.request;

public class UserRequest {
    private String username;
    private String fullName;
    private String propic;
    private String label;

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPropic() {
        return propic;
    }

    public void setPropic(String propic) {
        this.propic = propic;
    }

    public String getLabel() {
        return username;
    }

    public void setLabel(String label) {
        this.label = label;
    }
}
