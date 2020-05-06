package com.tognyp.springsecurity.demo.service;

import com.tognyp.springsecurity.demo.entity.User;
import com.tognyp.springsecurity.demo.user.QuestUser;

import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {

    User findByUserName(String userName);

    void save(QuestUser questUser);
}
