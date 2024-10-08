package com.InfinityArcade.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.InfinityArcade.models.Inquary;

public class InquireController {
	public static void addInquary(Inquary newInquary) {
		 Connection con = null;
	        PreparedStatement pst = null;

	        try {
	            con = DBConnection.initializeDatabase();

	            String query = "INSERT INTO Inquary ( userID, name, email, subject, message ) " +
	                           "VALUES ( ?, ?, ?, ?, ? )";

	            pst = con.prepareStatement(query);
	            pst.setString(1, newInquary.getUserID());
	            pst.setString(2, newInquary.getname());
	            pst.setString(3, newInquary.getEmail());
	            pst.setString(4, newInquary.getSubject());
	            pst.setString(5, newInquary.getmessage());
	           
	            
	            

	            pst.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (pst != null) pst.close();
	                if (con != null) con.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }


	}
	
	public static List<Inquary> readAllInquary(String username) {
        List<Inquary> inquaries = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Establish the database connection
            con = DBConnection.initializeDatabase();

            // Ensure the connection is not null
            if (con != null) {
                String query = "SELECT * FROM Inquary WHERE userID = ?";
                pst = con.prepareStatement(query);
	            pst.setString(1, username);

                // Execute the query
                rs = pst.executeQuery();

                // Check if rs is null before accessing it
                if (rs != null) {
                    while (rs.next()) {
                        Inquary inq = new Inquary();
                        inq.setinquaryID(rs.getString("inquireID"));
                        inq.setName(rs.getString("name"));
                        inq.setEmail(rs.getString("email"));
                        inq.setSubject(rs.getString("subject"));
                        inq.setmessage(rs.getString("message"));

                        inquaries.add(inq);
                    }
                } else {
                    System.out.println("ResultSet is null. Query may have failed.");
                }
            } else {
                System.out.println("Database connection failed.");
            }

        } catch (SQLException e) {
            e.printStackTrace();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return inquaries;
    }
	
	public static Inquary getInq(String inqID) {
		Inquary inq = new Inquary();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Establish the database connection
            con = DBConnection.initializeDatabase();

            // Ensure the connection is not null
            if (con != null) {
                String query = "SELECT * FROM Inquary WHERE inquireID = ? LIMIT 1";
                pst = con.prepareStatement(query);
	            pst.setString(1, inqID);

                // Execute the query
                rs = pst.executeQuery();

                // Check if rs is null before accessing it
                if (rs.next()) {
                    
                    inq.setinquaryID(rs.getString("inquireID"));
                    inq.setName(rs.getString("name"));
                    inq.setEmail(rs.getString("email"));
                    inq.setSubject(rs.getString("subject"));
                    inq.setmessage(rs.getString("message"));

                } else {
                    System.out.println("ResultSet is null. Query may have failed.");
                }
            } else {
                System.out.println("Database connection failed.");
            }

        } catch (SQLException e) {
            e.printStackTrace();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return inq;
    }
	public static boolean updateInquary(Inquary updatedInquary) {
		
	        Connection con = null;
	        PreparedStatement pst = null;
	        boolean returnValue = false;

	        try {
	            con = DBConnection.initializeDatabase();

	            
	            String query = "UPDATE Inquary SET name = ?, email = ?, subject = ?, message = ? WHERE inquireID = ?";

	            
	            if (updatedInquary.getinquaryID() == null) {
	                throw new IllegalArgumentException("Inquary ID cannot be null");
	            }

	            pst = con.prepareStatement(query);
	            pst.setString(1, updatedInquary.getname());
	            pst.setString(2, updatedInquary.getEmail());
	            pst.setString(3, updatedInquary.getSubject());
	            pst.setString(4, updatedInquary.getmessage());
	            pst.setString(5, updatedInquary.getinquaryID());

	            returnValue = (pst.executeUpdate() > 0);

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (pst != null) pst.close();
	                if (con != null) con.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }

	        return returnValue;
	    }
	
	public static boolean deleteInquary(String inquaryID) {
		Connection con = null;
        PreparedStatement pst = null;
        boolean returnValue = false;

        try {
            con = DBConnection.initializeDatabase(); // Initialize your database connection

            // Prepare SQL DELETE statement
            String query = "DELETE FROM Inquary WHERE inquireID = ?";
            
            pst = con.prepareStatement(query);
            pst.setString(1, inquaryID);

            // Execute the update and check if any rows were affected
            returnValue = (pst.executeUpdate() > 0);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Clean up resources
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
		return returnValue;
	}
}