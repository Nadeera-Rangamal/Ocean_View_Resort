package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.AddRoomServlet;

public class RoomDAO {

    
    public boolean addRoom(AddRoomServlet room) {
        String sql = "INSERT INTO rooms (room_number, room_type, price, description, image_name) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = dbconnection.getConnection()) {
            
            if (conn == null) return false;

            try (PreparedStatement st = conn.prepareStatement(sql)) {
                st.setString(1, room.getRoomNumber());
                st.setString(2, room.getRoomType());
                st.setDouble(3, room.getPrice());
                st.setString(4, room.getDescription());
                st.setString(5, room.getImageName());

                return st.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            System.err.println("SQL Error: Failed to add room.");
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    
    public List<AddRoomServlet> getAllRooms() {
        List<AddRoomServlet> rooms = new ArrayList<>();
        String sql = "SELECT * FROM rooms";

        try (Connection conn = dbconnection.getConnection()) {
            
            if (conn == null) return rooms;

            try (Statement st = conn.createStatement();
                 ResultSet rs = st.executeQuery(sql)) {

                while (rs.next()) {
                    AddRoomServlet room = new AddRoomServlet(
                        rs.getString("room_number"),
                        rs.getString("room_type"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getString("image_name")
                    );
                    rooms.add(room);
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Error: Failed to retrieve rooms.");
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rooms;
    }
    
    
}