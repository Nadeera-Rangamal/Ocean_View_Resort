package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import models.GuestBilling;
import DAO.BillingDAO;

@WebServlet("/GuestBilling")
public class billing extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        GuestBilling bill = new GuestBilling();

        bill.setReservation_no(request.getParameter("reservation_no"));
        bill.setGuest_name(request.getParameter("guest_name"));
        bill.setRoom_no(request.getParameter("room_no"));
        bill.setCheck_in(request.getParameter("check_in"));
        bill.setCheck_out(request.getParameter("check_out"));
        bill.setNum_nights(Integer.parseInt(request.getParameter("num_nights")));
        bill.setRoom_rate(Double.parseDouble(request.getParameter("room_rate")));
        bill.setRoom_charges(Double.parseDouble(request.getParameter("room_charges")));
        bill.setAdditional_charges(Double.parseDouble(request.getParameter("additional_charges")));
        bill.setTax(Double.parseDouble(request.getParameter("tax")));
        bill.setTotal_amount(Double.parseDouble(request.getParameter("total_amount")));
        bill.setPayment_method(request.getParameter("payment_method"));

        BillingDAO dao = new BillingDAO();
        boolean status = dao.saveBilling(bill);

        if (status) {
            response.sendRedirect("billing.jsp?msg=success");
        } else {
            response.sendRedirect("billing.jsp?msg=error");
        }
    }
}
