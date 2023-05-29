package com.example.ss9_java_web;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DiscountCalculatorServlet", value = "/DiscountCalculatorServlet")
public class DiscountCalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double price=Double.parseDouble(request.getParameter("price"));
        double percent=Double.parseDouble(request.getParameter("percent"));
        double discountAmount=price*percent*0.01;
        double discountPrice=price-discountAmount;
        request.setAttribute("discountAmount",discountAmount);
        request.setAttribute("discountPrice",discountPrice);
        RequestDispatcher r= request.getRequestDispatcher("ss9_discount.jsp");
        r.forward(request,response);
    }
}
