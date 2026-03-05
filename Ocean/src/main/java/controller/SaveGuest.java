package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

import models.Booking;
import DAO.BookingDAO;


@WebServlet("/SaveGuest")
public class SaveGuest extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String reservationNo = request.getParameter("reservation_no");
            String guestName = request.getParameter("guest_name");
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");
            String roomNo = request.getParameter("room_no");
            String checkInStr = request.getParameter("check_in");
            String checkOutStr = request.getParameter("check_out");
            String address = request.getParameter("address");
            String idNumber = request.getParameter("id_number");

            
            if (idNumber == null || idNumber.isEmpty()) {
                response.sendRedirect("viewGuest.jsp?status=invalid_id");
                return;
            }

            Date checkIn = Date.valueOf(checkInStr);
            Date checkOut = Date.valueOf(checkOutStr);

            Booking booking = new Booking(
                    reservationNo, guestName, email,
                    contact, roomNo, checkIn,
                    checkOut, address, idNumber
            );

            BookingDAO dao = new BookingDAO();
            boolean isSaved = dao.saveBooking(booking);

            if (isSaved) {
                response.sendRedirect("viewGuest.jsp?status=success");
            } else {
                response.sendRedirect("viewGuest.jsp?status=failed");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("viewGuest.jsp?status=error");
        }
    }
}