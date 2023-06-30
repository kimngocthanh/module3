package com.example.ss10_bai_tap1.service;

import com.example.ss10_bai_tap1.model.Customer;
import com.example.ss10_bai_tap1.repository.CustomerRepository;
import com.example.ss10_bai_tap1.repository.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService{
    private ICustomerRepository iCustomerRepository = new CustomerRepository();
    @Override
    public List<Customer> display() {
        return iCustomerRepository.display();
    }
}
