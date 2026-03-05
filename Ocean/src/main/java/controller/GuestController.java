package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import models.Guest;
import DAO.GuestDAO;

@WebServlet("/Guest")
public class GuestController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ Capture form data
        String guestName = request.getParameter("guestName");
        String email = request.getParameter("email");
        String idNumber = request.getParameter("idNumber");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String reservationDate = request.getParameter("reservationDate");
        String reservationTime = request.getParameter("reservationTime");

        System.out.println("Form submitted! Guest: " + guestName); // Debug

        // 2️⃣ Wrap into Model
        Guest guest = new Guest(guestName, email, idNumber,
                                address, contact,
                                reservationDate, reservationTime);

        // 3️⃣ Save using DAO
        GuestDAO dao = new GuestDAO();
        boolean isSaved = dao.saveGuest(guest);

        // 4️⃣ Redirect
        if (isSaved) {
            response.sendRedirect("guestadd.jsp?status=success");
        } else {
            response.sendRedirect("guestadd.jsp?status=failed");
        }
    }
}
