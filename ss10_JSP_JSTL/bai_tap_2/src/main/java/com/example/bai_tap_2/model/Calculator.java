package com.example.bai_tap_2.model;

public class Calculator {

    public static double calculate(double firstOperand, double secondOperand, char operator ){
        switch (operator){
            case '+':
                return firstOperand + secondOperand;
            case '-':
                return firstOperand - secondOperand;
            case '*':
                return firstOperand * secondOperand;
            case '/':
                if(secondOperand == 0) {
                    throw new RuntimeException("Can't divide by zero");
                } else {
                    return firstOperand / secondOperand;}
            default:
                throw new RuntimeException("Invalid operation");
        }
    }
}
