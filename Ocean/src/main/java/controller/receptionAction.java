package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import DAO.ReceptionistDAO;

@WebServlet("/receptionAction")
public class receptionAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String username = request.getParameter("id");
        ReceptionistDAO dao = new ReceptionistDAO();

        if ("delete".equals(action)) {
            if (dao.deleteReceptionist(username)) {
                response.sendRedirect("viewreception.jsp?msg=deleted");
            } else {
                response.sendRedirect("viewreception.jsp?msg=error");
            }
        }
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");

        ReceptionistDAO dao = new ReceptionistDAO();
        if (dao.updateReceptionist(email, contact, address, username)) {
            response.sendRedirect("viewreception.jsp?msg=updated");
        } else {
            response.sendRedirect("viewreception.jsp?msg=error");
        }
    }
}