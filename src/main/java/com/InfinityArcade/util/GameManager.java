package com.InfinityArcade.util;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.InfinityArcade.models.Game;

public class GameManager {
    public static boolean addNewGame(Game game) {
        Connection con = null;
        PreparedStatement pst = null;
        boolean returnValue = false;

        try {
            con = DBConnection.initializeDatabase();

            // Corrected SQL query with `desc` column name escaped
            String query = "INSERT INTO game (gameID, gameName, `desc`, gameTitle, devName, genre, tags, img, price) " +
                           "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            pst = con.prepareStatement(query);
            pst.setString(1, game.getGameID());
            pst.setString(2, game.getGameName());
            pst.setString(3, game.getDesc());
            pst.setString(4, game.getGameTitle());
            pst.setString(5, game.getDevName());
            pst.setString(6, game.getGenre());
            pst.setString(7, game.getTags());
            pst.setString(8, game.getImg());
            pst.setDouble(9, game.getPrice());

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
    
    public static List<Game> getAllGames() {
        List<Game> gameList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = DBConnection.initializeDatabase();

            String query = "SELECT * FROM game";
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                Game game = new Game();
                game.setGameID(rs.getString("gameID"));
                game.setGameName(rs.getString("gameName"));
                game.setGenre(rs.getString("genre"));
                game.setImg(rs.getString("img"));
                game.setPrice(rs.getDouble("price"));
                

                gameList.add(game);
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

        return gameList;
    }
    
    public static Game getGame(String gameID) {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Game game = null; // Initialize game to null

        try {
            con = DBConnection.initializeDatabase();

            String query = "SELECT * FROM game WHERE gameID = ?";
            pst = con.prepareStatement(query);
            pst.setString(1, gameID);
            rs = pst.executeQuery();

            // Check if the result set has data
            if (rs.next()) {
                game = new Game();
                
                game.setGameID(rs.getString("gameID"));
                game.setGameName(rs.getString("gameName"));
                game.setDesc(rs.getString("desc"));
                game.setGameTitle(rs.getString("gameTitle"));
                game.setDevName(rs.getString("devName"));
                game.setGenre(rs.getString("genre"));
                game.setTags(rs.getString("tags"));
                game.setImg(rs.getString("img"));
                game.setPrice(rs.getDouble("price"));
                game.setUploadDate(rs.getString("uploadedDate"));
                game.setUpdatedDate(rs.getString("updatedDate"));
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

        return game; // Return the game object or null if no game is found
    }
    
    public static boolean updateGame(Game game) {
        Connection con = null;
        PreparedStatement pst = null;
        boolean returnValue = false;

        try {
            con = DBConnection.initializeDatabase();

            // Corrected SQL query with proper syntax
            String query = "UPDATE game SET gameName = ?, `desc` = ?, gameTitle = ?, devName = ?, genre = ?, tags = ?, img = ?, price = ?, updatedDate = NOW() " +
                           "WHERE gameID = ?";

            // Check if gameID is null
            if (game.getGameID() == null) {
                throw new IllegalArgumentException("Game ID cannot be null");
            }

            pst = con.prepareStatement(query);
            pst.setString(1, game.getGameName());
            pst.setString(2, game.getDesc());
            pst.setString(3, game.getGameTitle());
            pst.setString(4, game.getDevName());
            pst.setString(5, game.getGenre());
            pst.setString(6, game.getTags());
            pst.setString(7, game.getImg());
            pst.setDouble(8, game.getPrice());
            pst.setString(9, game.getGameID()); // Use gameID to identify which game to update

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
    public static boolean deleteGame(String gameID) {
        Connection con = null;
        PreparedStatement pst = null;
        boolean returnValue = false;

        try {
            con = DBConnection.initializeDatabase(); // Initialize your database connection

            // Prepare SQL DELETE statement
            String query = "DELETE FROM game WHERE gameID = ?";
            
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
