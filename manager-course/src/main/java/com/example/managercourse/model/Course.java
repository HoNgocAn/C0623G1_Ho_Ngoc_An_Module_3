package com.example.managercourse.model;

public class Course {
    private int id;
    private String name;
    private String description;
    private String instructor;
    private double price;
    private int categoryId;
    private String knowledge;
    private String device_requirements;
    private String otherInfoCourse;

    public Course(int id, String name, String description, String instructor, double price, int categoryId, String knowledge, String device_requirements, String otherInfoCourse) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.instructor = instructor;
        this.price = price;
        this.categoryId = categoryId;
        this.knowledge = knowledge;
        this.device_requirements = device_requirements;
        this.otherInfoCourse = otherInfoCourse;
    }

    public Course(String name, String description, String instructor, double price, int categoryId , String knowledge, String device_requirements, String otherInfoCourse) {
        this.name = name;
        this.description = description;
        this.instructor = instructor;
        this.price = price;
        this.categoryId = categoryId;
        this.knowledge = knowledge;
        this.device_requirements = device_requirements;
        this.otherInfoCourse = otherInfoCourse;
    }

    public Course(int course_id, String name, String description, double price) {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getKnowledge() {
        return knowledge;
    }

    public void setKnowledge(String knowledge) {
        this.knowledge = knowledge;
    }

    public String getDevice_requirements() {
        return device_requirements;
    }

    public void setRequirements(String device_requirements) {
        this.device_requirements = device_requirements;
    }

    public String getOtherInfoCourse() {
        return otherInfoCourse;
    }

    public void setOtherInfoCourse(String otherInfoCourse) {
        this.otherInfoCourse = otherInfoCourse;
    }
}
