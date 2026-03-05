package DAO;

import java.sql.Connection;
import java.util.List;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import models.Booking;

public class BookingDAO {

    public boolean saveBooking(Booking booking) {
        String sql = "INSERT INTO booking (reservation_no, guest_name, email, contact, room_no, check_in, check_out, address, id_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        
        try (Connection conn = dbconnection.getConnection()) {
            
            if (conn == null) {
                System.out.println("Error: Connection is null!");
                return false;
            }
            
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, booking.getReservationNo());
                ps.setString(2, booking.getGuestName());
                ps.setString(3, booking.getEmail());
                ps.setString(4, booking.getContact());
                ps.setString(5, booking.getRoomNo());
                
                
                ps.setDate(6, booking.getCheckIn());
                ps.setDate(7, booking.getCheckOut());
                
                ps.setString(8, booking.getAddress());
                ps.setString(9, booking.getIdNumber());

                int result = ps.executeUpdate();
                return result > 0;
            }
            
        } catch (SQLException e) {
            System.err.println("SQL Error in saveBooking method.");
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public java.util.List<Booking> getAllBookings() {
        java.util.List<Booking> bookings = new java.util.ArrayList<>();
        String sql = "SELECT * FROM booking";

        try (Connection conn = dbconnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             java.sql.ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Booking booking = new Booking(
                    rs.getString("reservation_no"),
                    rs.getString("guest_name"),
                    rs.getString("email"),
                    rs.getString("contact"),
                    rs.getString("room_no"),
                    rs.getDate("check_in"),
                    rs.getDate("check_out"),
                    rs.getString("address"),
                    rs.getString("id_number")
                );
                bookings.add(booking);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookings;
    }
    public boolean deleteBooking(String reservationNo) {
        String sql = "DELETE FROM booking WHERE reservation_no = ?";
        
        try (Connection conn = dbconnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, reservationNo);
            int result = ps.executeUpdate();
            return result > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}