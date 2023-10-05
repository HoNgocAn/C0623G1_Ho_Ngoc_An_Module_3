package com.example.managercourse.repository;

import com.example.managercourse.model.Course;

import java.util.List;

public interface ICourseRepository {
    List<Course> showList ();
    void createCourse(Course course);
    Course selectCourse(int id);
    boolean deleteCourse(int id);
    boolean updateCourse( Course course);
}
