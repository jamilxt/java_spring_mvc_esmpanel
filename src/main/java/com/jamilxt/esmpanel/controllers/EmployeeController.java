package com.jamilxt.esmpanel.controllers;

import com.jamilxt.esmpanel.dtos.UserDto;
import com.jamilxt.esmpanel.request.User;
import com.jamilxt.esmpanel.service.*;
import com.jamilxt.esmpanel.util.Constants;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class EmployeeController extends BaseService {

    final UserService userService;
    final AuthorityService authorityService;
    final ServletContext context;
    final SettingService settingService;
    final BankAccountService bankAccountService;

    public EmployeeController(UserService userService, AuthorityService authorityService, ServletContext context, SettingService settingService, BankAccountService bankAccountService) {
        this.userService = userService;
        this.authorityService = authorityService;
        this.context = context;
        this.settingService = settingService;
        this.bankAccountService = bankAccountService;
    }

    @GetMapping("/employee")
    public String showAllUser(Model model) {
        model.addAttribute("pageTitle", "Employee List");
        model.addAttribute("authUser", getLoggedInUser());
        model.addAttribute("balance", bankAccountService.getBankBalanceByUsername(getLoggedInUser().getUsername()));
        model.addAttribute("users", userService.showAll());
        model.addAttribute("message", "Showing all Employee...");
        return "/employee/show-all";
    }

    @GetMapping("/employee/add")
    public String getAddUser(Model model, @ModelAttribute("user") User user) {
        model.addAttribute("pageTitle", "Add User");
        model.addAttribute("authUser", getLoggedInUser());
        model.addAttribute("balance", bankAccountService.getBankBalanceByUsername(getLoggedInUser().getUsername()));
        model.addAttribute("user", new User());
        model.addAttribute("message", "Add a new User");
        System.out.println(authorityService.listAllAuthorities().size());
        model.addAttribute("authorities", authorityService.listAllAuthorities());
        return "employee/add";
    }

    @PostMapping("/employee/add")
    public String addUser(Model model, @ModelAttribute("user") User user, @RequestParam("file") MultipartFile file) {

        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                String absoluteFilePath = context.getRealPath(Constants.UPLOADED_FOLDER);
                Path path = Paths.get(absoluteFilePath + file.getOriginalFilename());
                Files.write(path, bytes);
                user.setPropic(file.getOriginalFilename());
            } catch (IOException e) {
                throw new RuntimeException(e.getMessage());
            }
        }

        var userDto = new UserDto();
        BeanUtils.copyProperties(user, userDto);
        userService.addUser(userDto);

        model.addAttribute("message", "User added successfully");
        return "redirect:/employee";

    }

    @GetMapping("/employee/delete")
    public String deleteUser(Model model, @RequestParam("userId") long userId) {
        userService.deleteUser(userId);
        model.addAttribute("message", "User deleted successfully");
        return "redirect:/employee";
    }

    @GetMapping(value = "employee/is_available")
    public @ResponseBody
    ResponseEntity<?> isUsernameAvailable(@RequestParam(name = "username") String username) {
        var data = userService.isUsernameAvailable(username);
        return new ResponseEntity<>(data, HttpStatus.OK);
    }

    @GetMapping(value = "employee/search")
    public @ResponseBody
    ResponseEntity<?> searchUserByUsername(@RequestParam(name = "term") String query) {
        var data = userService.findUser(query);
        return new ResponseEntity<>(data, HttpStatus.OK);
    }

}
