package com.example.ss10_jsp_jstl.service.impl;

import com.example.ss10_jsp_jstl.model.Customer;
import com.example.ss10_jsp_jstl.repository.impl.CustomerRepo;
import com.example.ss10_jsp_jstl.service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private CustomerRepo customerRepo=new CustomerRepo();
    @Override
    public List<Customer> display() {
        return customerRepo.display();
    }
}
