package com.example.ss10_jsp_jstl.repository.impl;

import com.example.ss10_jsp_jstl.model.Customer;
import com.example.ss10_jsp_jstl.repository.ICustomerRepo;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepo implements ICustomerRepo {
    private static List<Customer> list=new ArrayList<>();
    static {
        list.add(new Customer("Hoa","31/01/2000","Quang Nam","https://orig00.deviantart.net/5540/f/2011/221/2/5/a_chibi_girl_commission_by_chocomax-d45ywwf.png"));
        list.add(new Customer("Hung","01/01/1998","Da Nang","https://s-media-cache-ak0.pinimg.com/736x/95/5c/43/955c4391c36f982cd65a127a7b3d793b.jpg"));
        list.add(new Customer("Vu","02/01/1998","Quang Nam","https://wallpaperaccess.com/full/1699120.jpg"));
    }
    @Override
    public List<Customer> display() {
        return list;
    }
}
