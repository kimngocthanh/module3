package com.example.ss12_bai_tap.service;

import com.example.ss12_bai_tap.model.Users;
import com.example.ss12_bai_tap.repository.IUsersRepository;
import com.example.ss12_bai_tap.repository.UsersRepository;

import java.util.List;
import java.util.Map;

public class UsersService implements IUsersService{
    private final IUsersRepository iUsersRepository = new UsersRepository();
    @Override
    public Map<Integer, Users> display() {
        return iUsersRepository.display();
    }

    @Override
    public void add(Users users) {
        iUsersRepository.add(users);
    }

    @Override
    public void update(int id, Users users) {
        iUsersRepository.edit(id,users);
    }

    @Override
    public void delete(int id) {
        iUsersRepository.delete(id);
    }

    @Override
    public List<Users> search(String country) {
        return iUsersRepository.search(country);
    }
}
