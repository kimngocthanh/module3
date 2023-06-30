package com.example.ss10_bai_tap01.repository;

import com.example.ss10_bai_tap01.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository{
    private static List<Customer> customerList = new ArrayList<>();
    static {
        Customer customer = new Customer(1,"Kim Ngọc Thành","1983/09/09","đà nẵng","https://thuthuatnhanh.com/wp-content/uploads/2019/06/anh-anime-nam.jpg");
        Customer customer1 = new Customer(2,"Nguyễn Văn A","1983/09/09","đà nẵng","https://thuthuatnhanh.com/wp-content/uploads/2019/06/anh-anime-nam.jpg");
        Customer customer2 = new Customer(3,"Trần Văn B","1983/09/09","đà nẵng","https://thuthuatnhanh.com/wp-content/uploads/2019/06/anh-anime-nam.jpg");
        customerList.add(customer);
        customerList.add(customer1);
        customerList.add(customer2);
    }

    @Override
    public List<Customer> display() {
        return customerList;
    }
}
