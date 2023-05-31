package com.example.ss11_mvc.service.impl;

import com.example.ss11_mvc.model.Product;
import com.example.ss11_mvc.repository.IProductRepo;
import com.example.ss11_mvc.repository.impl.ProductRepo;
import com.example.ss11_mvc.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepo iProductRepo=new ProductRepo();
    @Override
    public List<Product> display() {
        return iProductRepo.display();
    }

    @Override
    public void add(Product product) {
        iProductRepo.add(product);
    }

    @Override
    public void delete(int id) {
        iProductRepo.delete(id);
    }

    @Override
    public void edit(int id, String name, double price, String description, String manufacturer) {
        iProductRepo.edit(id,name,price,description,manufacturer);
    }

    @Override
    public Product findById(int id) {
        return iProductRepo.findById(id);
    }
}
