package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import DAO.ReceptionistDAO;
import models.Receptionist; 

@WebServlet("/LoginServlet")
public class login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        
        ReceptionistDAO dao = new ReceptionistDAO(); // Use the DAO, not the Model
        
        if (dao.validate(user, pass)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("reciption.jsp"); 
        } else {
            response.sendRedirect("login.jsp?status=error");
        }
    }
}