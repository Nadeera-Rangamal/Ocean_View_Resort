package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException; // SQLException එක import කරගන්න
import models.GuestBilling;

public class BillingDAO {

    public boolean saveBilling(GuestBilling bill) {

        boolean status = false;

        
        try (Connection conn = dbconnection.getConnection()) {

            if (conn == null) {
                System.out.println("Database connection is null!");
                return false;
            }

            String sql = "INSERT INTO payment_status "
                    + "(reservation_no, guest_name, room_no, check_in, check_out, "
                    + "num_nights, room_rate, room_charges, additional_charges, "
                    + "tax, total_amount, payment_method) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, bill.getReservation_no());
            ps.setString(2, bill.getGuest_name());
            ps.setString(3, bill.getRoom_no());
            ps.setString(4, bill.getCheck_in());
            ps.setString(5, bill.getCheck_out());
            ps.setInt(6, bill.getNum_nights());
            ps.setDouble(7, bill.getRoom_rate());
            ps.setDouble(8, bill.getRoom_charges());
            ps.setDouble(9, bill.getAdditional_charges());
            ps.setDouble(10, bill.getTax());
            ps.setDouble(11, bill.getTotal_amount());
            ps.setString(12, bill.getPayment_method());

            
            int result = ps.executeUpdate();
            status = result > 0;

        } catch (SQLException e) {
            System.err.println("SQL Error while saving billing details.");
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}