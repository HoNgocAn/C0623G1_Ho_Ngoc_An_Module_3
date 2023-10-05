package com.example.managercourse.service;

import com.example.managercourse.model.Course;

import java.util.List;

public interface ICourseService {
    List<Course> showList ();
    void createCourse(Course course);
    Course selectCourse(int id);
    boolean deleteCourse(int id);
    boolean updateCourse( Course course);
}
