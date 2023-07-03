package com.example.mvc1.service;

import com.example.mvc1.model.Customer;
import com.example.mvc1.repository.CustomerRepository;
import com.example.mvc1.repository.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService{
    private final ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> displayCustomer() {
        return customerRepository.display();
    }
}
