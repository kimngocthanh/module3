package com.example.ss10_bai_tap1.repository;

import com.example.ss10_bai_tap1.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static List<Customer> customerList = new ArrayList<>();

    static {
        Customer customer = new Customer(1,"Mai Văn Hoàn","1983-08-20","Hà Nội","https://thuthuatnhanh.com/wp-content/uploads/2019/06/anh-anime-nam.jpg");
        Customer customer1 = new Customer(2,"Nguyễn Văn Nam","1983-08-21","Đà Nẵng","https://thuthuatnhanh.com/wp-content/uploads/2019/06/anh-anime-nam.jpg");
        Customer customer2 = new Customer(3,"Nguyễn Thái Hoà","1983-08-22","Hồ Chí Minh","https://thuthuatnhanh.com/wp-content/uploads/2019/06/anh-anime-nam.jpg");
        Customer customer3 = new Customer(4,"Trần Đăng Khoá","1983-08-17","Quảng Ninh","https://thuthuatnhanh.com/wp-content/uploads/2019/06/anh-anime-nam.jpg");
        Customer customer4 = new Customer(5,"Nguyễn Đình Thi","1983-08-19","Huế","https://thuthuatnhanh.com/wp-content/uploads/2019/06/anh-anime-nam.jpg");
        customerList.add(customer);
        customerList.add(customer1);
        customerList.add(customer2);
        customerList.add(customer3);
        customerList.add(customer4);
    }

    @Override
    public List<Customer> display() {
        return customerList;
    }
}
