package com.example.ss10_bai_tap02;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "calculator", value = "/calculator")
public class calculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstNumber = Double.parseDouble(request.getParameter("firstNumber"));
        double secondNumber = Double.parseDouble(request.getParameter("secondNumber"));
        String subtend = request.getParameter("subtend");
        double result = 0;
        PrintWriter out = response.getWriter();
        switch (subtend){
            case "total":
                result = firstNumber+secondNumber;
                break;
            case "sub":
                result = firstNumber-secondNumber;
                break;
            case "core":
                result = firstNumber*secondNumber;
                break;
            case "div":
                try {
                    if(secondNumber==0){
                        out.println("ko thể chia cho 0");
                    }
                    result = firstNumber/secondNumber;
                } catch (RuntimeException e) {
                    throw new RuntimeException(e.getMessage());
                }
                break;
        }

        request.setAttribute("result", result);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("calculatorResult.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}