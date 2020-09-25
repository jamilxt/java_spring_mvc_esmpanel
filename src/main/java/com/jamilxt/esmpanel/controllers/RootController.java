package com.jamilxt.esmpanel.controllers;

import com.jamilxt.esmpanel.model.Authority;
import com.jamilxt.esmpanel.model.User;
import com.jamilxt.esmpanel.repositories.UserRepository;
import com.jamilxt.esmpanel.service.AuthorityService;
import com.jamilxt.esmpanel.service.PostService;
import com.jamilxt.esmpanel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

// For showing index-old.jsp instead of showing the "not found page" error
@Controller
public class RootController {

    private final UserRepository userRepository;
    private final AuthorityService authorityService;
    private final PasswordEncoder passwordEncoder;
    private final PostService postService;

    @Autowired
    UserService userService;

    public RootController(UserRepository userRepository, PasswordEncoder passwordEncoder, AuthorityService authorityService, PostService postService) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.authorityService = authorityService;
        this.postService = postService;
    }

    @GetMapping("/")
    public String root(Model model, HttpSession httpSession) {
        User userEntity = (User) httpSession.getAttribute("authUser");
        model.addAttribute("authUser", userEntity);
        return "index";
    }

    @GetMapping("/explore")
    public String explorePage(Model model) {
        model.addAttribute("pageTitle", "Explore");
        return "/explore/index";
    }

    @GetMapping("/explore/tags/{tag}")
    public String explorePageTags(Model model, @PathVariable(value = "tag") String tag) {
        model.addAttribute("pageTitle", tag + " hashtag on instagram_clone • Photos and Videos");
        return "/explore/tags";
    }

    @GetMapping("/login")
    public String login(Model model, @RequestParam(name = "error", required = false) String error) {
        generateRoles();
        generateUsers();
        model.addAttribute("pageTitle", "Login");
        model.addAttribute("error", error);
        return "/accounts/login";
    }

    @GetMapping("/accounts/emailsignup")
    public String emailsignup(Model model, @RequestParam(name = "error", required = false) String error) {
        model.addAttribute("pageTitle", "Sign up");
        model.addAttribute("error", error);
        return "/accounts/emailsignup";
    }

    @GetMapping("/403")
    public String _403() {
        return "403";
    }

    private void generateRoles() {
        authorityService.create(new Authority(System.nanoTime(), "ROLE_ADMIN"));
        authorityService.create(new Authority(System.nanoTime(), "ROLE_EMPLOYEE"));
    }

    private void generateUsers() {

        if (userRepository.findByUsername("admin").isEmpty()) {
            var user = new User();
            user.setUsername("admin");
            user.setPassword(passwordEncoder.encode("secret"));
            user.setFullName("Admin");
            user.setGender("M");
            user.setEmail("admin@gmail.com");
            user.setEnabled(true);
            user.setDob(LocalDate.now());
            Set<Authority> authorities = new HashSet<>();
            authorities.add(authorityService.findByRoleName("ROLE_ADMIN"));
            user.setAuthorities(authorities);
            userRepository.save(user);
        }

        if (userRepository.findByUsername("user").isEmpty()) {
            var user = new User();
            user.setUsername("user");
            user.setPassword(passwordEncoder.encode("secret"));
            user.setFullName("User");
            user.setGender("M");
            user.setEmail("user@gmail.com");
            user.setEnabled(true);
            user.setDob(LocalDate.now());
            Set<Authority> authorities = new HashSet<>();
            authorities.add(authorityService.findByRoleName("ROLE_EMPLOYEE"));
            user.setAuthorities(authorities);
            userRepository.save(user);
        }
    }

    @GetMapping("/{username}")
    public String userProfile(Model model, @PathVariable(value = "username") String username) {
        model.addAttribute("pageTitle", "@" + username + " - instagram_clone photos and videos");
        User user = (User) userService.loadUserByUsername(username);
        model.addAttribute("user", user);
        model.addAttribute("totalPosts", postService.totalPostsOfUser(user));
        return "profile";
    }


    @GetMapping("/accounts/edit")
    public String editProfile(Model model) {
        model.addAttribute("pageTitle", "Edit Profile");
        return "accounts/edit";
    }

    @PostMapping("/edit_profile")
    public String editProfile_POST(Model model, @RequestParam(name = "image") MultipartFile file, HttpSession session) {
        String path = session.getServletContext().getRealPath("/");
        String filename = file.getOriginalFilename();

        System.out.println(path + " " + filename);
        try {
            byte[] barr = file.getBytes();

            BufferedOutputStream bout = new BufferedOutputStream(
                    new FileOutputStream(path + "/" + filename));
            bout.write(barr);
            bout.flush();
            bout.close();

        } catch (Exception ex) {
            System.out.println(ex);
        }

        model.addAttribute("filename", path + "/" + filename);
        return "profile/edit";
    }


}
