package com.example.bai_tap.service;

import com.example.bai_tap.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();

    void save(Product product);

    Product findById(int id);

    void update(int id, Product product);

    void remove(int id) throws Exception;
}
