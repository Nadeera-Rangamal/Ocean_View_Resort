package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import DAO.BookingDAO;

@WebServlet("/CancelBooking")
public class CancelBooking extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        
        String reservationNo = request.getParameter("id");
        
        if (reservationNo != null && !reservationNo.isEmpty()) {
            BookingDAO dao = new BookingDAO();
            boolean isDeleted = dao.deleteBooking(reservationNo);
            
            if (isDeleted) {
                
                response.sendRedirect("viewBooking.jsp?status=cancelled");
            } else {
                response.sendRedirect("viewBooking.jsp?status=error");
            }
        } else {
            response.sendRedirect("viewBooking.jsp");
        }
    }
}