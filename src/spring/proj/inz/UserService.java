package com.tognyp.springsecurity.demo.service;

import com.tognyp.springsecurity.demo.entity.User;
import com.tognyp.springsecurity.demo.user.QuestUser;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

/**
* User service interface 
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public interface UserService extends UserDetailsService {

    User findByUserName(String userName);

    void save(QuestUser questUser);
    
    List<User> findAllUsers();
    
    boolean addNewRole(String userName, String roleName);
}
