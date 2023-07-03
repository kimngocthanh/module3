package com.example.ss11_bai_tap.service;

import com.example.ss11_bai_tap.model.Product;

import java.util.List;
import java.util.Map;

public interface IProductService {
    Map<Integer, Product> display();
    void addProduct(int id,Product product);
    void deleteProduct(int id);
    void editProduct(int id, Product product);
}
