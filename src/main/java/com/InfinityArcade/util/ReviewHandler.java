package com.InfinityArcade.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.InfinityArcade.models.Review;

public class ReviewHandler {
    public static boolean addReview(Review r) {
        Connection con = null;
        PreparedStatement stmt = null;
        boolean returnValue = false;

        try {
            con = DBConnection.initializeDatabase();

          //Query
            String sql = "INSERT INTO Review (user_id, game_id, rating_value, comment) VALUES (?, ?, ?, ?)";

            // Prepare the SQL statement
            stmt = con.prepareStatement(sql);

            // Set the parameters for the prepared statement
            stmt.setString(1, r.getUser());
            stmt.setString(2, r.getGameId());
            stmt.setString(3, r.getRating());
            stmt.setString(4, r.getReview());
          
            
            returnValue = (stmt.executeUpdate() > 0);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return returnValue;
    }
    
    public static List<Review> getAllReviews(String gameID) {
        List<Review> reviewList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = DBConnection.initializeDatabase();

            String query = "SELECT * FROM Review WHERE game_id = ? ";
            pst = con.prepareStatement(query);
            pst.setString(1, gameID);
            rs = pst.executeQuery();

            while (rs.next()) {
                Review  r1 = new Review();

                 r1.setReviewID(rs.getString("review_id"));
                 r1.setUser(rs.getString("user_id"));
                 r1.setPostedDate(rs.getString("created_at"));
                 r1.setGameId(rs.getString("game_id"));
                 r1.setUpdatedDate(rs.getString("updated_at"));
                 r1.setRating(rs.getString("rating_value"));
                 r1.setReview(rs.getString("comment"));
                

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
   
    public static Review getReview(String revID) {
        Review r1 = new Review();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = DBConnection.initializeDatabase();

            String query = "SELECT * FROM Review WHERE review_id = ? ";
            pst = con.prepareStatement(query);
            pst.setString(1, revID);
            rs = pst.executeQuery();

            if (rs.next()) {

                 r1.setReviewID(rs.getString("review_id"));
                 r1.setUser(rs.getString("user_id"));
                 r1.setPostedDate(rs.getString("created_at"));
                 r1.setGameId(rs.getString("game_id"));
                 r1.setUpdatedDate(rs.getString("updated_at"));
                 r1.setRating(rs.getString("rating_value"));
                 r1.setReview(rs.getString("comment"));
          
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

        return r1;
    }
    
    public static boolean updateReview(Review r1) {
        Connection con = null;
        PreparedStatement pst = null;
        boolean returnValue = false;

        try {
            con = DBConnection.initializeDatabase();

            // Corrected SQL query with proper syntax
            String query = "UPDATE review SET rating_value = ?, comment = ? " +
                           "WHERE review_id = ?";

            // Check if gameID is null
            if (r1.getReview() == null) {
                throw new IllegalArgumentException("This Review area  cannot be null");
            }
            

            pst = con.prepareStatement(query);
            pst.setString(1, r1.getRating());
            pst.setString(2, r1.getReview());
            pst.setString(3, r1.getReviewID());
          

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
    
    public static boolean deleteReview(String revID) {
		Connection con = null;
        PreparedStatement pst = null;
        boolean returnValue = false;

        try {
            con = DBConnection.initializeDatabase(); // Initialize your database connection

            // Prepare SQL DELETE statement
            String query = "DELETE FROM Review WHERE review_id = ?";
            
            pst = con.prepareStatement(query);
            pst.setString(1, revID);

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

