package com.example.ss10_jsp_jstl.controller;

import com.example.ss10_jsp_jstl.model.Customer;
import com.example.ss10_jsp_jstl.service.impl.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private CustomerService customerService=new CustomerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher;
        String action=request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "showformdelete":
                break;
            default:
                List<Customer> list= customerService.display();
                request.setAttribute("list",list);
                requestDispatcher=request.getRequestDispatcher("display.jsp");
                requestDispatcher.forward(request,response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
