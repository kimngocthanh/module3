package com.example.ss11_bai_tap.service;

import com.example.ss11_bai_tap.model.Product;
import com.example.ss11_bai_tap.repository.IProductRepository;
import com.example.ss11_bai_tap.repository.ProductRepository;

import java.util.Map;

public class ProductService implements IProductService{
    private final IProductRepository productRepository = new ProductRepository();
    @Override
    public Map<Integer, Product> display() {
        return productRepository.display();
    }

    @Override
    public void addProduct(int id,Product product) {
        productRepository.add(product.getIdProduct(), product);
    }

    @Override
    public void deleteProduct(int id) {
        productRepository.delete(id);
    }

    @Override
    public void editProduct(int id, Product product) {
        productRepository.edit(id,product);
    }
}
