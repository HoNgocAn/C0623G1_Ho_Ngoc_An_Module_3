package com.example.bai_tap_1.controller;


import com.example.bai_tap_1.model.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList;
    static {
        customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","https://kenh14cdn.com/thumb_w/660/203336854389633024/2022/12/7/photo-1-16703795510471153055899.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam","1983-08-21","Bắc Giang","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4tn2YkbtaeB2pYjHZfvSKk9Jrcb2Kwsb6OA&usqp=CAU"));
        customerList.add(new Customer("Nguyễn Thái Hòa","1983-08-22","Nam Định","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREnnBzsIH3x8Bi-FYF3fFL7UScvogIJvGyUQ&usqp=CAU"));
        customerList.add(new Customer("Trần Đăng Khoa","1983-08-17","Hà Tây","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpcCsQ4s8ErJCWJkKIZvwxzgzQJNjZF6tEPQ&usqp=CAU"));
        customerList.add(new Customer("Nguyễn Đình Thi","1983-08-19","Hà Nội","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRv3y_Go5Kkx9tpd48YQGO9yay53CBFtBlWqA&usqp=CAU"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request,response);
    }

}