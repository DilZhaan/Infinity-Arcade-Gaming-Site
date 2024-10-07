package com.InfinityArcade.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.InfinityArcade.models.Game;
import com.InfinityArcade.models.Inquary;

public class InquireController {
	public static void addInquary(Inquary newInquary) {
		 Connection con = null;
	        PreparedStatement pst = null;

	        try {
	            con = DBConnection.initializeDatabase();

	            String query = "INSERT INTO Inquary (inquireID, userID, name, email, subject, message) " +
	                           "VALUES (?, ?, ?, ?, ?, ?)";

	            pst = con.prepareStatement(query);
	            pst.setString(1, newInquary.getinquaryID());
	            pst.setString(1, newInquary.getUserID());
	            pst.setString(1, newInquary.getname());
	            pst.setString(1, newInquary.getEmail());
	            pst.setString(1, newInquary.getSubject());
	            pst.setString(1, newInquary.getmessage());
	           
	            

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
	
	public static List<Inquary> readAllInquary(String userID, Object inquary) {

        List<Inquary> inquaryList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = DBConnection.initializeDatabase();

            String query = "SELECT * FROM inquary WHERE ";
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	Inquary inquary1 = new Inquary();
                inquary1.setinquaryID(rs.getString("InquaryID"));
                inquary1.setName(rs.getString("Name"));
                inquary1.setEmail(rs.getString("Email"));
                inquary1.setSubject(rs.getString("Subject"));
                inquary1.setmessage(rs.getString("Message"));
                

                inquaryList.add(inquary1);
            }

        } catch (SQLException | ClassNotFoundException e) {
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

        return inquaryList;
    
	}
	public static boolean updateInquary(Inquary updatedInquary) {
		
	        Connection con = null;
	        PreparedStatement pst = null;
	        boolean returnValue = false;

	        try {
	            con = DBConnection.initializeDatabase();

	            
	            String query = "UPDATE inquary SET Name = ?, Email = ?, Subject = ?, Message = ?, updatedDate = NOW() " +
	                           "WHERE inquaryID = ?";

	            
	            if (updatedInquary.getinquaryID() == null) {
	                throw new IllegalArgumentException("Inquary ID cannot be null");
	            }

	            pst = con.prepareStatement(query);
	            pst.setString(1, updatedInquary.getname());
	            pst.setString(2, updatedInquary.getEmail());
	            pst.setString(3, updatedInquary.getSubject());
	            pst.setString(4, updatedInquary.getmessage());
	            pst.setString(5, updatedInquary.getinquaryID()); // Use inquaryID to identify which game to update

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

	}
	public static boolean deleteInquary(String inquaryID) {
		Connection con = null;
        PreparedStatement pst = null;
        boolean returnValue = false;

        try {
            con = DBConnection.initializeDatabase(); // Initialize your database connection

            // Prepare SQL DELETE statement
            String query = "DELETE FROM inquary WHERE inquaryID = ?";
            
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