package com.example.ss11_bai_tap.controller;

import com.example.ss11_bai_tap.model.Product;
import com.example.ss11_bai_tap.service.IProductService;
import com.example.ss11_bai_tap.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductController", value = "/ProductController")
public class ProductController extends HttpServlet {
    private final IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "showCreate":
                showCreateProduct(request, response);
                break;
            case "delete":
                showDeleteProduct(request, response);
                break;
            case "edit":
                showEdit(request, response);
                break;
            default:
                listProduct(request, response);
                break;
        }
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double price = Double.parseDouble(request.getParameter("priceProduct"));
        int id = Integer.parseInt(request.getParameter("id"));
        String describeProduct = request.getParameter("describeProduct");
        String producerProduct = request.getParameter("producerProduct");
        String nameProduct = request.getParameter("nameProduct");
        Product product = new Product(id, nameProduct, price, describeProduct, producerProduct);
        request.setAttribute("id", id);
        request.setAttribute("product", product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showDeleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id", id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/delete.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showCreateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = new ArrayList<>(productService.display().values());
        String msg = request.getParameter("msg");
        request.setAttribute("msg", msg);
        request.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/list.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        double price = Double.parseDouble(request.getParameter("priceProduct"));
        String describeProduct = request.getParameter("describeProduct");
        String producerProduct = request.getParameter("producerProduct");
        String nameProduct = request.getParameter("nameProduct");
        Product product = new Product(id, nameProduct, price, describeProduct, producerProduct);
        productService.editProduct(id, product);
        response.sendRedirect("/ProductController?msg=sua%20thanh%20cong");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.deleteProduct(id);
        response.sendRedirect("/ProductController?msg=them%20moi%20thanh%20cong");
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = (int) (Math.random() * 10000);
        String nameProduct = request.getParameter("nameProduct");
        double priceProduct = Double.parseDouble(request.getParameter("priceProduct"));
        String describeProduct = request.getParameter("describeProduct");
        String producerProduct = request.getParameter("producerProduct");
        Product product = new Product(id, nameProduct, priceProduct, describeProduct, producerProduct);
        productService.addProduct(id, product);
        response.sendRedirect("/ProductController?msg=them%20moi%20thanh%20cong");
    }
}