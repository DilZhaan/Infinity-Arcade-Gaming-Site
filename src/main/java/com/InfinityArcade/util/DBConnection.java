package com.InfinityArcade.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Static method to establish and return the database connection
    public static Connection initializeDatabase() throws SQLException, ClassNotFoundException {
  
        String jdbcURL = "jdbc:mysql://localhost:3306/infinity_arcade";
        String dbUser = "root";
        String dbPassword = "root";

        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish and return the connection
        return DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
    }
}
