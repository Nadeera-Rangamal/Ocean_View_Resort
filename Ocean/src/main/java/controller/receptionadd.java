

package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import models.Receptionist; // Import the POJO
import DAO.ReceptionistDAO; // Import the DAO

@WebServlet("/Receptionist")
public class receptionadd extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Capture data
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 2. Wrap data into the Model object
        Receptionist newReceptionist = new Receptionist(firstName, lastName, email, contact, address, username, password);

        // 3. Use DAO to save to database
        ReceptionistDAO dao = new ReceptionistDAO();
        boolean isSaved = dao.registerReceptionist(newReceptionist);

        // 4. Redirect based on result
        if (isSaved) {
            response.sendRedirect("receptionadd.jsp?status=success");
        } else {
            response.sendRedirect("receptionadd.jsp?status=error");
        }
    }
}