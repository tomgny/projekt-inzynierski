package com.tognyp.springsecurity.demo.dao;

import java.util.List;

import com.tognyp.springsecurity.demo.entity.User;

/**
* DAO interface of User entity
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public interface UserDao {

    User findByUserName(String userName);
    
    void save(User user);
    
    List<User> findAllUsers();
    
}
