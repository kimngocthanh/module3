package com.example.ss12_bai_tap.repository;

import com.example.ss12_bai_tap.model.Users;

import java.util.List;
import java.util.Map;

public interface IUsersRepository {
    Map<Integer, Users> display();
    void add(Users users);
    void edit(int id,Users users);
    void delete(int id);
    List<Users> search(String country);
    List<Users> sort();
}
