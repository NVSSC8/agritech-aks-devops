package com.agritech.controller;

import com.agritech.entity.User;
import com.agritech.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    // REGISTER

    @PostMapping("/register")
    public String register(@RequestBody User user) {

        System.out.println("========== REGISTER API ==========");
        System.out.println("USERNAME: " + user.getUsername());

        userRepository.save(user);

        return "User Registered Successfully";
    }

    // LOGIN

    @PostMapping("/login")
    public String login(@RequestBody User user) {

        User dbUser =
                userRepository.findByUsername(user.getUsername());

        if (dbUser == null) {
            return "User Not Found";
        }

        if (dbUser.getPassword().equals(user.getPassword())) {
            return "Login Successful";
        }

        return "Invalid Password";
    }
}
