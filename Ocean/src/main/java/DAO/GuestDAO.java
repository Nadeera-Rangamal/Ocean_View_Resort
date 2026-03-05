package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import models.Guest;

public class GuestDAO {

    public boolean saveGuest(Guest guest) {
        String sql = "INSERT INTO reservation " +
                "(guest_name, email, id_number, address, contact, reservation_date, reservation_time) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        
        try (Connection conn = dbconnection.getConnection()) {
            
            if (conn == null) {
                System.out.println("Error: Could not establish database connection.");
                return false;
            }

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, guest.getGuestName());
                ps.setString(2, guest.getEmail());
                ps.setString(3, guest.getIdNumber());
                ps.setString(4, guest.getAddress());
                ps.setString(5, guest.getContact());
                ps.setString(6, guest.getReservationDate());
                ps.setString(7, guest.getReservationTime());

                int result = ps.executeUpdate();
                return result > 0;
            }

        } catch (SQLException e) {
            System.err.println("SQL Exception: Unable to save guest data.");
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}