package com.example.users.controller;

import com.example.users.model.User;
import com.example.users.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userDAO;

    public void init() {
        userDAO = new UserService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                addUserToDb(request, response);
                break;
            case "edit":
                updateUserToDb(request, response);
                break;
            case "delete":
                deleteUserToDb(request, response);
                break;
            case "search":
                showSearchResult(request,response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
                showInfoUser(request, response);
                break;
            case "delete":
                showDeleteUser(request, response);
                break;
            default:
                showListUser(request, response);
                break;
        }
    }

    private void showInfoUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userDAO.getUserByIdSp(id);
        if (user != null) {
            request.setAttribute("user", user);
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

    private void showDeleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userDAO.getUserByIdSp(id);
        if (user != null) {
            request.setAttribute("user", user);
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
        User user = userDAO.getUserByIdSp(id);
        if (user != null) {
            request.setAttribute("user", user);
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

    private void showListUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userDAO.displayListUserSp();
        request.setAttribute("userList", userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("users/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void deleteUserToDb(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        if (userDAO.deleteUserSp(id)) {
            showListUser(request, response);
        } else {
            error404(request,response);
        }
    }

    private void updateUserToDb(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        if (userDAO.updateUserSp(new User(id, name, email, country))){
            showListUser(request, response);
        } else {
            error404(request,response);
        }
    }

    private void addUserToDb(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        String add = request.getParameter("add");
        String edit = request.getParameter("edit");
        String delete = request.getParameter("delete");
        String view = request.getParameter("view");
        List<Integer> permissions = new ArrayList<>();
        if (add != null){
            permissions.add(1);
        }
        if (edit != null){
            permissions.add(2);
        }
        if (delete != null){
            permissions.add(3);
        }
        if (view != null){
            permissions.add(4);
        }

        User newUser = new User(name, email, country);
        userDAO.addUserTransaction(newUser, permissions);
        showListUser(request, response);
    }
    private void showSearchResult(HttpServletRequest request, HttpServletResponse response){
        String country = request.getParameter("country");
        List<User> userList = userDAO.findByCountry(country);
        System.out.println(userList);
        request.setAttribute("country",country);
        request.setAttribute("userList",userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("users/search-result.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}