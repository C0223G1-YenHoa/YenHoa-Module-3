package com.example.ss11_mvc.repository;

import com.example.ss11_mvc.model.Product;

import java.util.List;

public interface IProductRepo {
   List<Product> display();
   void add(Product product);
   void delete(int id);
   void edit(int id, String name, double price, String description, String manufacturer);
   Product findById(int id);
}
