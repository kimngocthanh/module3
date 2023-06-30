package com.example.ss10_bai_tap1.model;

public class Customer {
    private int id;
    private String name;
    private String date;
    private String address;
    private String img;

    public Customer() {

    }

    public Customer(int id, String name, String date, String address, String img) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.address = address;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
