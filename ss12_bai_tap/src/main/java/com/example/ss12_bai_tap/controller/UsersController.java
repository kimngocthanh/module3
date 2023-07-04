package com.example.ss12_bai_tap.controller;

import com.example.ss12_bai_tap.model.Users;
import com.example.ss12_bai_tap.service.IUsersService;
import com.example.ss12_bai_tap.service.UsersService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UsersController", value = "/UsersController")
public class UsersController extends HttpServlet {
    private final IUsersService usersService = new UsersService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action){
            case "create" :
                showCreate(request,response);
                break;
            case "update":
                showUpdate(request,response);
                break;
            case "delete":
                showDelete(request,response);
                break;
            case "search":
                showSearch(request,response);
                break;
            default:
                viewList(request,response);
                break;
        }
    }

    private void showSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/search.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id =Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id",id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/delete.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id",id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/edit.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/create.jsp");
        requestDispatcher.forward(request,response);
    }

    private void viewList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Users> usersList = new ArrayList<>(usersService.display().values());
        request.setAttribute("usersList",usersList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/list.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }switch (action){
            case "create":
                createUsers(request,response);
                break;
            case "update":
                updateUsers(request,response);
                break;
            case "delete":
                deleteUsers(request,response);
                break;
            case "search":
                searchUsers(request,response);
                break;
        }
    }

    private void searchUsers(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String country = request.getParameter("country");
        usersService.search(country);
        response.sendRedirect("/UserController");
    }

    private void deleteUsers(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        usersService.delete(id);
        response.sendRedirect("/UsersController");
    }

    private void updateUsers(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        Users users = new Users(id,name,email,country);
        usersService.update(id,users);
        response.sendRedirect("/UsersController");
    }

    private void createUsers(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        Users users = new Users(name,email,country);
        usersService.add(users);
        response.sendRedirect("/UsersController");
    }
}