package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbconnection {
    
    // Database credentials
    private static final String URL = "jdbc:mysql://localhost:3306/ocean";
    private static final String USER = "root";
    private static final String PASSWORD = ""; // Leave empty for default XAMPP/WAMP
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";

    /**
     * Establishes and returns a connection to the MySQL database.
     * @return Connection object
     */
    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Load the MySQL Driver
            Class.forName(DRIVER);
            // Get the connection
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.out.println("Error: MySQL Driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Error: Failed to connect to the database.");
            e.printStackTrace();
        }
        return conn;
    }
}