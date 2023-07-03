package com.example.ss11_bai_tap.repository;

import com.example.ss11_bai_tap.model.Product;

import java.util.Map;

public interface IProductRepository {
    Map<Integer, Product> display();
    void add(int id,Product product);
    void delete(int id);
    void edit(int id,Product product);
}