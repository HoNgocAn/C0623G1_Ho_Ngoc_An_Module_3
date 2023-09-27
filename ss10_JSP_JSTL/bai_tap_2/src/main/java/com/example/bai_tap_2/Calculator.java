package com.example.bai_tap_2;

public class Calculator {
    private double firstOperand;
    private double secondOperand;

    public double Addition(double firstOperand, double secondOperand){
        return firstOperand+secondOperand;
    }
    public double Subtraction(double firstOperand, double secondOperand){
        return firstOperand-secondOperand;
    }
    public double Multiplication(double firstOperand, double secondOperand){
        return firstOperand*secondOperand;
    }
    public double Division(double firstOperand, double secondOperand){
        return firstOperand/secondOperand;
    }


    public double getFirstOperand() {
        return firstOperand;
    }

    public void setFirstOperand(double firstOperand) {
        this.firstOperand = firstOperand;
    }

    public double getSecondOperand() {
        return secondOperand;
    }

    public void setSecondOperand(double secondOperand) {
        this.secondOperand = secondOperand;
    }
}
