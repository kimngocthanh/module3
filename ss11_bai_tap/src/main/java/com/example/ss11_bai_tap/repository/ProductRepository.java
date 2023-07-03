package com.example.ss11_bai_tap.repository;

import com.example.ss11_bai_tap.model.Product;

import java.util.HashMap;
import java.util.Map;

public class ProductRepository implements IProductRepository{
    private static Map<Integer,Product> productMap = new HashMap<>();
    static {
        Product product1 = new Product(1,"a",11,"a","a");
        Product product2 = new Product(2,"b",12,"b","b");
        Product product3 = new Product(3,"c",13,"c","c");
        Product product4 = new Product(4,"d",14,"d","d");
        Product product5 = new Product(5,"e",15,"e","e");
        Product product6 = new Product(6,"f",16,"f","f");
        productMap.put(1,product1);
        productMap.put(2,product2);
        productMap.put(3,product3);
        productMap.put(4,product4);
        productMap.put(5,product5);
        productMap.put(6,product6);
    }
    @Override
    public Map<Integer, Product> display() {
        return productMap;
    }

    @Override
    public void add(int id,Product product) {
        productMap.put(id,product);
    }

    @Override
    public void delete(int id) {
        productMap.remove(id);
    }

    @Override
    public void edit(int id, Product product) {
        productMap.remove(id);
        productMap.put(id,product);
    }


}
