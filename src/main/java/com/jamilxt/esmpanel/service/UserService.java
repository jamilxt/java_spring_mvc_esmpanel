package com.jamilxt.esmpanel.service;

import com.jamilxt.esmpanel.dtos.UserDto;
import com.jamilxt.esmpanel.exceptions.ResourceAlreadyExistsException;
import com.jamilxt.esmpanel.exceptions.ResourceNotFoundException;
import com.jamilxt.esmpanel.model.Authority;
import com.jamilxt.esmpanel.model.User;
import com.jamilxt.esmpanel.repositories.UserRepository;
import com.jamilxt.esmpanel.request.UserRequest;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class UserService extends BaseService implements UserDetailsService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final AuthorityService authorityService;

    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder, AuthorityService authorityService) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.authorityService = authorityService;
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        com.jamilxt.esmpanel.model.User userEntity = userRepository.findByUsername(s)
                .orElseThrow(() -> new ResourceNotFoundException("No user found with this username"));
        return userEntity;
    }

    public List<com.jamilxt.esmpanel.model.User> showAll() {
        return userRepository.findAllByActiveIsTrue();
    }

    public void addUser(UserDto userDto) {
        if (userRepository.findByUsername(userDto.getUsername()).isEmpty()) {

            var userEntity = new com.jamilxt.esmpanel.model.User();
            BeanUtils.copyProperties(userDto, userEntity);
            userEntity.setPassword(passwordEncoder.encode(userDto.getPassword()));

            Set<Authority> authorities = new HashSet<Authority>();
            for (var authorityName : userDto.getAuthorityNames()) {
                var authority = authorityService.findByRoleName(authorityName);
                authorities.add(authority);
            }
            userEntity.setAuthorities(authorities);

            userRepository.save(userEntity);

        } else {
            throw new ResourceAlreadyExistsException("Username is unavailable");
        }
    }

    public void deleteUser(Long userId) {
        userRepository.deleteById(userId); // will be converted to soft delete
    }

    public boolean isUsernameAvailable(String username) {
        return userRepository.findByUsername(username).isEmpty();
    }

    public List<UserRequest> findUser(String query) {
        var users = this.userRepository.getUsersByQueryString(query);
        var userRequests = new ArrayList<UserRequest>();

        for (var user : users) {
            var userRequest = new UserRequest();
            BeanUtils.copyProperties(user, userRequest);
            userRequests.add(userRequest);
        }

        return userRequests;
    }

    public long totalEmployee() {
        return userRepository.count() - 1;
    }

    public void save(User user) {
        userRepository.save(user);
    }

    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

}