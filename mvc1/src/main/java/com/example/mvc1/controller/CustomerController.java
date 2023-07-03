package com.example.mvc1.controller;

import com.example.mvc1.model.Customer;
import com.example.mvc1.service.CustomerService;
import com.example.mvc1.service.ICustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerController", value = "/CustomerController")
public class CustomerController extends HttpServlet {
    private static final ICustomerService customerService = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.displayCustomer();
        request.setAttribute("customerList",customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}