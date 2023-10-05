package com.example.managercourse.service.impl;

import com.example.managercourse.model.Course;
import com.example.managercourse.repository.ICourseRepository;
import com.example.managercourse.repository.impl.CourseRepository;
import com.example.managercourse.service.ICourseService;

import java.util.List;

public class CourseService implements ICourseService {
    private final ICourseRepository courseRepository = new CourseRepository();
    @Override
    public List<Course> showList() {
        return courseRepository.showList();
    }

    @Override
    public void createCourse(Course course) {
        courseRepository.createCourse(course);
    }

    @Override
    public Course selectCourse(int id) {
        return courseRepository.selectCourse(id);
    }

    @Override
    public boolean deleteCourse(int id) {
        return courseRepository.deleteCourse(id);
    }

    @Override
    public boolean updateCourse( Course course) {
        return courseRepository.updateCourse(course);
    }
}
