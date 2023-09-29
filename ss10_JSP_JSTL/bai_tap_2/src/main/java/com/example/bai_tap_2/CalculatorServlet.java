package com.example.bai_tap_2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculate")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstOperand = Double.parseDouble(request.getParameter("first-operand"));
        double secondOperand = Double.parseDouble(request.getParameter("second-operand"));
        char operator = request.getParameter("operator").charAt(0);
        PrintWriter writer = response.getWriter();
        try{
            double result = Calculator.calculate(firstOperand, secondOperand, operator);
            writer.println(firstOperand + " " + operator + " " + secondOperand + " = " + result);
        }catch (Exception ex){
            writer.println("Error: " + ex.getMessage());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
