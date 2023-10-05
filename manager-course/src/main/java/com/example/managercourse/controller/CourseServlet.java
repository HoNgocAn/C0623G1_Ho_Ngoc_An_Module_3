package com.example.managercourse.controller;

import com.example.managercourse.model.Course;
import com.example.managercourse.service.ICourseService;
import com.example.managercourse.service.impl.CourseService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CourseServlet", value = "/course")
public class CourseServlet extends HttpServlet {
    private final ICourseService courseService = new CourseService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "view":
                showInfoCourse(request, response);
                break;
            case "delete":
                showDeleteCourse(request, response);
                break;
            default:
                showListCourse(request, response);
                break;
        }
    }

    private void showInfoCourse(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Course course = courseService.selectCourse(id);
        if (course != null) {
            request.setAttribute("course", course);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("users/info.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            error404(request, response);
        }
    }

    private void showDeleteCourse(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Course course = courseService.selectCourse(id);
        if (course != null) {
            request.setAttribute("course", course);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("users/form-delete.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            error404(request, response);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Course course = courseService.selectCourse(id);
        if (course != null) {
            request.setAttribute("course", course);
            request.setAttribute("id", id);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("users/edit-user.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            error404(request, response);
        }
    }

    private static void error404(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("users/error-404.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("users/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showListCourse(HttpServletRequest request, HttpServletResponse response) {
        List<Course> courseList = courseService.showList();
        request.setAttribute("courseList", courseList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("users/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                addCourseToDb(request, response);
                break;
            case "edit":
                updateCourseToDb(request, response);
                break;
            case "delete":
                deleteCourseToDb(request, response);
                break;
        }
    }

    private void deleteCourseToDb(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        if (courseService.deleteCourse(id)) {
            showListCourse(request, response);
        } else {
            error404(request,response);
        }
    }

    private void updateCourseToDb(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String instructor = request.getParameter("instructor");
        double price = Double.parseDouble(request.getParameter("price"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String knowledge = request.getParameter("knowledge");
        String device_requirements = request.getParameter("device_requirements");
        String  otherInfoCourse = request.getParameter("otherInfoCourse");

        if (courseService.updateCourse(new Course(id, name, description , instructor, price, categoryId,knowledge,device_requirements,otherInfoCourse))){
            showListCourse(request, response);
        } else {
            error404(request,response);
        }
    }

    private void addCourseToDb(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String instructor = request.getParameter("instructor");
        double price = Double.parseDouble(request.getParameter("price"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String knowledge = request.getParameter("knowledge");
        String device_requirements = request.getParameter("device_requirements");
        String  otherInfoCourse = request.getParameter("otherInfoCourse");
        courseService.createCourse(new Course(name, description , instructor, price, categoryId,knowledge,device_requirements,otherInfoCourse));
        showListCourse(request, response);
    }
}
