package com.example.mvc1.repository;

import com.example.mvc1.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository{
    private static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer(1, "Nguyễn Văn A", "a@gmail.com", "Đà Nẵng"));
        customerList.add(new Customer(2, "Nguyễn Văn B", "b@gmail.com", "Hà Nội"));
        customerList.add(new Customer(3, "Nguyễn Văn C", "c@gmail.com", "Sai Gòn"));
        customerList.add(new Customer(4, "Nguyễn Văn D", "d@gmail.com", "Huế"));
    }

    @Override
    public List<Customer> display() {
        return customerList;
    }
}
