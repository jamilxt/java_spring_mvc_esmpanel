package com.jamilxt.esmpanel.service;

import com.jamilxt.esmpanel.model.User;
import org.springframework.security.core.context.SecurityContextHolder;

public abstract class BaseService {

    protected User getLoggedInUser() {

        return (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

    }

}
