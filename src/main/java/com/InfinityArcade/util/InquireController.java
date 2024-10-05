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
	
	public static List<Inquary> readAllInquary(String userID) {

        List<Game> gameList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = DBConnection.initializeDatabase();

            String query = "SELECT * FROM game WHERE ";
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
	public static void updateInquary(Inquary updatedInquary) {

	}
	public static boolean deleteInquary(String inquaryID) {
		return false;
	}
}