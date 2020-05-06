package com.tognyp.springsecurity.demo.dao;

import com.tognyp.springsecurity.demo.entity.User;

public interface UserDao {

    User findByUserName(String userName);
    
    void save(User user);
    
}
