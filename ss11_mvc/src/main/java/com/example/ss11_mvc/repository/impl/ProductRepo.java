package com.example.ss11_mvc.repository.impl;

import com.example.ss11_mvc.model.Product;
import com.example.ss11_mvc.repository.IProductRepo;

import java.util.ArrayList;
import java.util.List;

public class ProductRepo implements IProductRepo {
    private static List<Product> list=new ArrayList<>();
    static {
        list.add(new Product(1,"iPhone",12000,"iPhone 14","Apple"));
        list.add(new Product(2,"Motorbike",52000,"SH 125i","Honda"));
        list.add(new Product(3,"TV",10000,"SamSung 14in","SamSung"));
        list.add(new Product(4,"Camry",12000,"Camry 4","Toyota"));
    }
    @Override
    public List<Product> display() {
        return list;
    }

    @Override
    public void add(Product product) {
        list.add(product);
    }

    @Override
    public void delete(int id) {
        for (Product p: list) {
            if(p.getId()==id){
                list.remove(p);
                break;
            }
        }
    }

    @Override
    public void edit(int id, String name, double price, String description, String manufacturer) {
        for (Product p: list) {
            if(p.getId()==id){
                p.setName(name);
                p.setPrice(price);
                p.setDescription(description);
                p.setManufacturer(manufacturer);
                break;
            }
        }
    }

    @Override
    public Product findById(int id) {
        for (Product p: list) {
            if(p.getId()==id){
                return p;
            }
        }
        return null;
    }
}
