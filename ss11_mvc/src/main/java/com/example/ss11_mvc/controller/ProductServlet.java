package com.example.ss11_mvc.controller;

import com.example.ss11_mvc.model.Product;
import com.example.ss11_mvc.service.IProductService;
import com.example.ss11_mvc.service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product_servlet")
public class ProductServlet extends HttpServlet {
    private IProductService iProductService=new ProductService();
    private List<Product> list= iProductService.display();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher;

       String action= request.getParameter("action");
       if(action==null){
           action="";
       }
       switch (action){
           case "delete":
               //delete
               deleteProduct(request, response);
               break;
           case "edit":
               //edit
               editProduct(request, response);
               break;
           case "create":
               //add
               response.sendRedirect("create.jsp");
               break;
           default:
               showList(request, response);
       }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher;
        int id;
        id=Integer.parseInt(request.getParameter("id"));
        Product editProduct=iProductService.findById(id);
        request.setAttribute("id",id);
        request.setAttribute("editProduct",editProduct);
        requestDispatcher= request.getRequestDispatcher("edit.jsp");
        requestDispatcher.forward(request, response);
        response.sendRedirect("edit.jsp");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id;
        id=Integer.parseInt(request.getParameter("id"));
        iProductService.delete(id);
        response.sendRedirect("/product_servlet");
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action= request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "delete":
                //delete
                break;
            case "edit":
                //edit
                editProductPost(request, response);
                break;
            case "create":
                //add
                createProduct(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int newId=Integer.parseInt(request.getParameter("id"));
        String newName = request.getParameter("name");
        double newPrice=Double.parseDouble(request.getParameter("price"));
        String newDescription= request.getParameter("description");
        String newManufacturer= request.getParameter("manufacturer");
        Product newProduct= new Product(newId,newName,newPrice,newDescription,newManufacturer);
        iProductService.add(newProduct);
        response.sendRedirect("/product_servlet");
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher;
        List<Product> list= iProductService.display();
        request.setAttribute("list",list);
        requestDispatcher = request.getRequestDispatcher("/display.jsp");
        requestDispatcher.forward(request, response);
    }

    private void editProductPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price=Double.parseDouble(request.getParameter("price"));
        String description= request.getParameter("description");
        String manufacturer= request.getParameter("manufacturer");
        iProductService.edit(id,name,price,description,manufacturer);
        response.sendRedirect("/product_servlet");
    }
}
