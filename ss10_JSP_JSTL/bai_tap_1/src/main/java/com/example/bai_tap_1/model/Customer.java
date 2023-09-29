package com.example.bai_tap_1.model;

public class Customer {
    private String name;
    private String birthday;
    private String adress;
    private String img;

    public Customer(String name, String birthday, String adress, String img) {
        this.name = name;
        this.birthday = birthday;
        this.adress = adress;
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}