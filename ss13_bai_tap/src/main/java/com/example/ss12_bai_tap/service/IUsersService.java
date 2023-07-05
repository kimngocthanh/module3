package com.example.ss12_bai_tap.service;

import com.example.ss12_bai_tap.model.Users;

import java.util.List;
import java.util.Map;

public interface IUsersService {
    Map<Integer, Users> display();
    void add(Users users);
    void update(int id, Users users);
    void delete(int id);
    List<Users> search(String country);
    List<Users> sort();
}
