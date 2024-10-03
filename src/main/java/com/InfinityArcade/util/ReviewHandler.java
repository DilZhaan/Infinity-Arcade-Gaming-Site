package com.InfinityArcade.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.InfinityArcade.models.ReviewModel;

public class ReviewHandler {
    public static boolean addReview(ReviewModel r) {
        Connection con = null;
        PreparedStatement pst = null;
        boolean returnValue = false;

        try {
            con = DBConnection.initializeDatabase();

          //Query
            String query = "INSERT INTO review (user, gameId, date,rating,review) " +
                           "VALUES (?, ?, ?, ?,?)";

            pst = con.prepareStatement(query);
            pst.setString(1, r.getUser());
            pst.setString(2, r.getGameId());
            pst.setLong(3, r.getDate());
            pst.setInt(4, r.getRating());
            pst.setString(5, r.getReview());
          
            
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
    
    public static List<ReviewModel> getAllReviews() {
        List<ReviewModel> reviewList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = DBConnection.initializeDatabase();

            String query = "SELECT * FROM review WHERE gameID = ? ";
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                ReviewModel  r1 = new ReviewModel();
       
                 r1.setUser(rs.getString("user"));
                 r1.setGameId(rs.getString("gameid"));
                 r1.setDate(rs.getLong("date"));
                 r1.setRating(rs.getInt("rating"));
                 r1.setReview(rs.getString("review"));
                

                reviewList.add(r1);
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

        return reviewList;
    }
   

    
    public static boolean updateReview(ReviewModel r1) {
        Connection con = null;
        PreparedStatement pst = null;
        boolean returnValue = false;

        try {
            con = DBConnection.initializeDatabase();

            // Corrected SQL query with proper syntax
            String query = "UPDATE review SET user = ?, gameid = ?, date = ?, rating = ?, review = ?  " +
                           "WHERE gameid = ?";

            // Check if gameID is null
            if (r1.getReview() == null) {
                throw new IllegalArgumentException("This Review area  cannot be null");
            }
            

            pst = con.prepareStatement(query);
            pst.setString(1, r1.getUser());
            pst.setString(2, r1.getGameId());
            pst.setLong(3, r1.getDate());
            pst.setInt(4, r1.getRating());
            pst.setString(5, r1.getReview());
          

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
    public static boolean ReviewGame(String gameID) {
        Connection con = null;
        PreparedStatement pst = null;
        boolean returnValue = false;

        try {
            con = DBConnection.initializeDatabase(); // Initialize your database connection

            // Prepare SQL DELETE statement
            String query = "DELETE FROM review WHERE gameid = ?";
            
            pst = con.prepareStatement(query);
            pst.setString(1, gameID);

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

        return returnValue; // Return true if deletion was successful, false otherwise
    }
}
    