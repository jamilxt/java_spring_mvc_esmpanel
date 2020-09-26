package com.jamilxt.esmpanel.service;

import com.jamilxt.esmpanel.dtos.UserDto;
import com.jamilxt.esmpanel.exceptions.ResourceAlreadyExistsException;
import com.jamilxt.esmpanel.exceptions.ResourceNotFoundException;
import com.jamilxt.esmpanel.model.Authority;
import com.jamilxt.esmpanel.model.User;
import com.jamilxt.esmpanel.repositories.UserRepository;
import com.jamilxt.esmpanel.request.UserRequest;
import com.jamilxt.esmpanel.response.UserResponse;
import org.springframework.beans.BeanUtils;
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
    private final SettingService settingService;

    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder, AuthorityService authorityService, SettingService settingService) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.authorityService = authorityService;
        this.settingService = settingService;
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        com.jamilxt.esmpanel.model.User userEntity = userRepository.findByUsername(s)
                .orElseThrow(() -> new ResourceNotFoundException("No user found with this username"));
        return userEntity;
    }

    public List<UserResponse> showAll() {
        List<UserResponse> userList = new ArrayList<>();
        for (User user : userRepository.findAllByActiveIsTrue()) {
            if (!user.getUsername().equals("admin")) {
                UserResponse userResponse = new UserResponse();
                userResponse.setId(user.getId());
                userResponse.setPropic(user.getPropic());
                userResponse.setUsername(user.getUsername());
                userResponse.setGrade(user.getGrade());
                userResponse.setSalary(getSalaryBasedOnGrade(user.getGrade()));
                userList.add(userResponse);
            }
        }
        return userList;
    }

    private Long getSalaryBasedOnGrade(int grade) {
        Long salary = 0L;
        switch (grade) {
            case 1:
                salary = settingService.getLowestGradeBasicSalaryValue() + (5000 * 5);
                break;
            case 2:
                salary = settingService.getLowestGradeBasicSalaryValue() + (5000 * 4);
                break;
            case 3:
                salary = settingService.getLowestGradeBasicSalaryValue() + (5000 * 3);
                break;
            case 4:
                salary = settingService.getLowestGradeBasicSalaryValue() + (5000 * 2);
                break;
            case 5:
                salary = settingService.getLowestGradeBasicSalaryValue() + 5000;
                break;
            case 6:
                salary = settingService.getLowestGradeBasicSalaryValue();
                break;
        }

        return salary;

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

    public User save(User user) {
        return userRepository.save(user);
    }

    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public User findById(Long id) {
        return userRepository.findById(id).get();
    }

}