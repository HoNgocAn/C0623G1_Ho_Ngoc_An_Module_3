package com.example.server_time;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Calculator", value = "calculator")
public class Calculator {
    protected void processRequest (HttpServletRequest request, HttpServletResponse response) throws SecurityException, IOException, ServletException {
        response.setContentType("text/html; charset = UTF-8");
        String f = request.getParameter("a");
        String s = request.getParameter("b");
        double first = Double.parseDouble(f);
        double second = Double.parseDouble(s);
        String operator = request.getParameter("ope");
        double result;
        if (operator.equals("+")){
            result = first + second;
        } else if (operator.equals("-")) {
            result = first - second;
        } else if (operator.equals("*")) {
            result = first*second;
        } else {
            result = first/second;
        }
        request.setAttribute("r", result);
        request.getRequestDispatcher("Calculator.jsp").forward(request,response);
    }
}
