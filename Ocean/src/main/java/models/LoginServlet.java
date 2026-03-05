package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import DAO.dbconnection; // DAO පැකේජයේ ඇති dbconnection එක import කරන්න

public class LoginServlet {
    
    public boolean validate(String username, String password) {
        boolean status = false;
        String sql = "SELECT * FROM reception WHERE username = ? AND password = ?";

        
        try (Connection conn = dbconnection.getConnection()) {
            
            if (conn == null) return false;

            try (PreparedStatement st = conn.prepareStatement(sql)) {
                st.setString(1, username);
                st.setString(2, password);

                try (ResultSet rs = st.executeQuery()) {
                    status = rs.next(); 
                }
            }

        } catch (SQLException e) {
            System.err.println("SQL Error during login validation.");
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}