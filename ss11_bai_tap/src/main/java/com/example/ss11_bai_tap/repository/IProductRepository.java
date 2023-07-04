package com.example.ss11_bai_tap.repository;

import com.example.ss11_bai_tap.model.Product;

import java.util.List;
import java.util.Map;

public interface IProductRepository {
    Map<Integer, Product> displaySearch();
    void add(int id,Product product);
    void delete(int id);
    void edit(int id,Product product);
    List<Product> displaySearch(String nameProduct);
}
