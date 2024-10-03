package com.InfinityArcade.util;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;


public class ReviewDB {
	public class DBConnection {
	    // Static method to establish and return the database connection
	    public static Connection initializeDatabase() throws SQLException, ClassNotFoundException {
	  
	        String jdbcURL = "jdbc:mysql://localhost:8085/infinity_arcade";
	        String dbUser = "root";
	        String dbPassword = "root";

	        Class.forName("com.mysql.cj.jdbc.Driver");

	        // Establish and return the connection
	        return DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	    }
	}

	
	
	
	


