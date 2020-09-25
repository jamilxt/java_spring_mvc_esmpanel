package com.jamilxt.esmpanel.model;

import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "tbl_user")
public class User implements UserDetails, Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "user_uuid")
    private long id;
    @Column(name = "username")
    private String username;
    @Column(name = "password", length = 512)
    private String password;
    @ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER, targetEntity = Authority.class)
    @JoinTable(name = "user_authority",
            joinColumns = {@JoinColumn(name = "user_id", referencedColumnName = "user_uuid")},
            inverseJoinColumns = {@JoinColumn(name = "role_id", referencedColumnName = "role_uuid")}
    )
    private Set<Authority> authorities;
    @Column(name = "fullname")
    private String fullName;
    @Column(name = "email")
    private String email;
    @Column(name = "gender")
    private String gender;
    @Column(name = "dob")
    private LocalDate dob;
    @Column(name = "is_active")
    private Boolean active = true;
    @Column(name = "propic")
    private String propic = "default.png";
    @Column(name = "website")
    private String website;
    @Column(name = "bio")
    private String bio;
    @Column(name = "phoneNumber")
    private String phoneNumber;

    @Column(nullable = false, name = "enabled")
    private boolean enabled = true;
    @Column(nullable = false, name = "accountNonExpired")
    private boolean accountNonExpired = true;
    @Column(nullable = false, name = "accountNonLocked")
    private boolean accountNonLocked = true;
    @Column(nullable = false, name = "credentialsNonExpired")
    private boolean credentialsNonExpired = true;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER, cascade = CascadeType.MERGE) // this needs to be LAZY - mainul35
    private List<Post> posts;

    @OneToOne
    private BankAccount bankAccount;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Override
    public List<Authority> getAuthorities() {
        List<Authority> authorities = new ArrayList<>();
        for (Authority authority : this.authorities) {
            authorities.add(authority);
        }
        return authorities;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return accountNonExpired;
    }

    @Override
    public boolean isAccountNonLocked() {
        return accountNonLocked;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return credentialsNonExpired;
    }

    @Override
    public boolean isEnabled() {
        return enabled;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAuthorities(Set<Authority> authorities) {
        this.authorities = authorities;
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

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public void setAccountNonExpired(boolean accountNonExpired) {
        this.accountNonExpired = accountNonExpired;
    }

    public void setAccountNonLocked(boolean accountNonLocked) {
        this.accountNonLocked = accountNonLocked;
    }

    public void setCredentialsNonExpired(boolean credentialsNonExpired) {
        this.credentialsNonExpired = credentialsNonExpired;
    }

    public List<Post> getPosts() {
        return posts;
    }

    public void setPosts(List<Post> posts) {
        this.posts = posts;
    }

    public BankAccount getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(BankAccount bankAccount) {
        this.bankAccount = bankAccount;
    }

}