package tests;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import DAO.dbconnection;
import java.sql.Connection;
import java.sql.SQLException;

public class DBConnectionTest {

    @Test
    void testGetConnectionSuccess() {
        
        Connection conn = dbconnection.getConnection();

        
        assertNotNull(conn, "The database connection should not be null. Please check the MySQL server (XAMPP).");

        try {
            
            assertFalse(conn.isClosed(), "The database connection must be in an active (Open) state.");
            
            
            conn.close();
        } catch (SQLException e) {
            fail("An SQL error occurred while checking the connection.: " + e.getMessage());
        }
    }
}