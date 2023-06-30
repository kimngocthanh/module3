package com.example.ss10_bai_tap01.service;

import com.example.ss10_bai_tap01.model.Customer;
import com.example.ss10_bai_tap01.repository.CustomerRepository;
import com.example.ss10_bai_tap01.repository.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService{
    private ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> display() {
        return customerRepository.display();
    }
}
