package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import models.Receptionist;
import java.util.ArrayList;
import java.util.List;

public class ReceptionistDAO {
    
    
    public boolean registerReceptionist(Receptionist receptionist) {
        String sql = "INSERT INTO reception (first_name, last_name, email, contact, address, username, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = dbconnection.getConnection()) {
            
            if (conn == null) return false;

            try (PreparedStatement st = conn.prepareStatement(sql)) {
                st.setString(1, receptionist.getFirstName());
                st.setString(2, receptionist.getLastName());
                st.setString(3, receptionist.getEmail());
                st.setString(4, receptionist.getContact());
                st.setString(5, receptionist.getAddress());
                st.setString(6, receptionist.getUsername());
                st.setString(7, receptionist.getPassword());
                
                return st.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            System.err.println("SQL Error: Registration failed.");
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    
    public boolean validate(String username, String password) {
        String sql = "SELECT * FROM reception WHERE username = ? AND password = ?";
        
        try (Connection conn = dbconnection.getConnection()) {
            
            if (conn == null) return false;

            try (PreparedStatement st = conn.prepareStatement(sql)) {
                st.setString(1, username);
                st.setString(2, password);
                
                try (ResultSet rs = st.executeQuery()) {
                    return rs.next(); 
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Error: Validation failed.");
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Receptionist> getAllReceptionists() {
        List<Receptionist> list = new ArrayList<>();
        String sql = "SELECT * FROM reception";
        
        try (Connection conn = dbconnection.getConnection();
             PreparedStatement st = conn.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {
            
            while (rs.next()) {
                Receptionist r = new Receptionist(
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("email"),
                    rs.getString("contact"),
                    rs.getString("address"),
                    rs.getString("username"),
                    rs.getString("password")
                );
                list.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
 
    public boolean deleteReceptionist(String username) {
        String sql = "DELETE FROM reception WHERE username = ?";
        try (Connection conn = dbconnection.getConnection();
             PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, username);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    
    public Receptionist getReceptionistByUsername(String username) {
        String sql = "SELECT * FROM reception WHERE username = ?";
        try (Connection conn = dbconnection.getConnection();
             PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, username);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return new Receptionist(
                        rs.getString("first_name"), rs.getString("last_name"),
                        rs.getString("email"), rs.getString("contact"),
                        rs.getString("address"), rs.getString("username"), ""
                    );
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    
    public boolean updateReceptionist(String email, String contact, String address, String username) {
        String sql = "UPDATE reception SET email = ?, contact = ?, address = ? WHERE username = ?";
        try (Connection conn = dbconnection.getConnection();
             PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, email);
            st.setString(2, contact);
            st.setString(3, address);
            st.setString(4, username);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}