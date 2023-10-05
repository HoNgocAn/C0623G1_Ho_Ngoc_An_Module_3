package com.example.managercourse.repository.impl;

import com.example.managercourse.model.Course;
import com.example.managercourse.repository.BaseRepository;
import com.example.managercourse.repository.ICourseRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class CourseRepository implements ICourseRepository {

    private static final String INSERT_COURSER_SQL = "INSERT INTO course (name, description,instructor, price, categoryId, knowledge, device_requirements, otherInfoCourse) VALUES (?,?,?,?,?,?,?,?);";
    private static final String SELECT_COURSE_BY_ID = "SELECT * FROM course WHERE id =?";
    private static final String SELECT_ALL_COURSE = "SELECT * FROM course ";
    private static final String DELETE_COURSE_SQL = "DELETE FROM course WHERE id = ?;";
    private static final String UPDATE_COURSE_SQL = "UPDATE course SET name = ?, description = ?, instructor =?, price =?, categoryId =?, knowledge =?, device_requirements =?, otherInfoCourse =?, WHERE id = ?;";

    @Override
    public List<Course> showList() {
        List<Course> courses = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        Course course;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ALL_COURSE);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                String instructor = resultSet.getString("instructor");
                double price = resultSet.getDouble("price");
                int categoryId = resultSet.getInt("categoryId");
                String knowledge = resultSet.getString("knowledge");
                String device_requirements = resultSet.getString("device_requirements");
                String otherInfoCourse = resultSet.getString("otherInfoCourse ");
                course = new Course(id, name, description,instructor,price,categoryId,knowledge,device_requirements,otherInfoCourse);
                courses.add(course);
            }
            resultSet.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return courses;
    }

    @Override
    public void createCourse(Course course) {
        Connection connection = BaseRepository.getConnection();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_COURSER_SQL);
            preparedStatement.setString(1, course.getName());
            preparedStatement.setString(2, course.getDescription());
            preparedStatement.setString(3, course.getInstructor());
            preparedStatement.setDouble(4, course.getPrice());
            preparedStatement.setInt(5, course.getCategoryId());
            preparedStatement.setString(6, course.getKnowledge());
            preparedStatement.setString(7, course.getDevice_requirements());
            preparedStatement.setString(8, course.getOtherInfoCourse());
        } catch (SQLException e){
            throw new RuntimeException();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }


    }

    @Override
    public Course selectCourse(int id) {
        Course course = null;
        Connection connection = BaseRepository.getConnection();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_COURSE_BY_ID);
            preparedStatement.setInt(1,id);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                String instructor = resultSet.getString("instructor");
                double price = resultSet.getDouble("price");
                int categoryId = resultSet.getInt("categoryId");
                String knowledge = resultSet.getString("knowledge");
                String device_requirements = resultSet.getString("device_requirements");
                String otherInfoCourse = resultSet.getString("otherInfoCourse ");
                course = new Course(id, name, description,instructor,price,categoryId,knowledge,device_requirements,otherInfoCourse);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e){
            throw new RuntimeException();
        }
        return course;
    }

    @Override
    public boolean deleteCourse(int id) {
        if (selectCourse(id) == null){
            return false;
        } else {
            Connection connection = BaseRepository.getConnection();
            try{ PreparedStatement preparedStatement = connection.prepareStatement(DELETE_COURSE_SQL);
                preparedStatement.setInt(1,id);
                preparedStatement.executeUpdate();
            } catch (SQLException e){
                throw new RuntimeException(e);
            }
            return true;
        }

    }

    @Override
    public boolean updateCourse( Course course) {
        if (selectCourse(course.getId()) == null) {
            return false;
        } else {
            Connection connection = BaseRepository.getConnection();
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_COURSE_SQL);
                preparedStatement.setString(1,course.getName());
                preparedStatement.setString(2, course.getDescription());
                preparedStatement.setString(3, course.getInstructor());
                preparedStatement.setDouble(4, course.getPrice());
                preparedStatement.setInt(5, course.getCategoryId());
                preparedStatement.setString(6, course.getKnowledge());
                preparedStatement.setString(7, course.getDevice_requirements());
                preparedStatement.setString(8, course.getOtherInfoCourse());
            } catch (SQLException e) {
                throw new RuntimeException();
            }
            return true;
        }
    }
}
