package com.InfinityArcade.util;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.InfinityArcade.models.Userduplicate;



public class UserDAOduplicate {
    private Connection connection;

    public UserDAOduplicate() {
        try {
            setConnection(DBConnection.initializeDatabase());
        } catch (SQLException | ClassNotFoundException e) {
            ((Throwable) e).printStackTrace();
        }
    }

	public Connection getConnection() {
		return connection;
	}

	public void setConnection(Connection connection) {
		this.connection = connection;
	}

    public void addUser(Userduplicate user) throws ClassNotFoundException {
        String sql = "INSERT INTO user (Username, FirstName, LastName, Address, Mobile, Email, Password, Is_Admin) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (	Connection connection = DBConnection.initializeDatabase();
        		PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getFirstName());
            statement.setString(3, user.getLastName());
            statement.setString(4, user.getAddress());
            statement.setString(5, user.getMobile());
            statement.setString(6, user.getEmail());
            statement.setString(7, user.getPassword());
            statement.setBoolean(8, user.isAdmin());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUser(Userduplicate user) throws ClassNotFoundException {
        String sql = "UPDATE user SET FirstName=?, LastName=?, Address=?, Mobile=?, Email=?, Is_Admin=? WHERE Username=?";
        try (	Connection connection = DBConnection.initializeDatabase();
        		PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getFirstName());
            statement.setString(3, user.getLastName());
            statement.setString(4, user.getAddress());
            statement.setString(5, user.getMobile());
            statement.setString(6, user.getEmail());
            statement.setString(7, user.getPassword());
            statement.setBoolean(8, user.isAdmin());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(String username) throws ClassNotFoundException {
        String sql = "DELETE FROM user WHERE Username=?";
        try (	Connection connection = DBConnection.initializeDatabase();
        		PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Userduplicate> listUsers() throws ClassNotFoundException {
        List<Userduplicate> users = new ArrayList<>();
        String sql = "SELECT * FROM user";
        
        try (	Connection connection = DBConnection.initializeDatabase();
        		Statement statement = connection.createStatement();
        		ResultSet resultSet = statement.executeQuery(sql)) {
        	
            while (resultSet.next()) {
                String username = resultSet.getString("Username");
                String firstName = resultSet.getString("FirstName");
                String lastName = resultSet.getString("LastName");
                String address = resultSet.getString("Address");
                String mobile = resultSet.getString("Mobile");
                String email = resultSet.getString("Email");
                
                boolean isAdmin = resultSet.getInt("Is_Admin") == 1;

                Userduplicate user = new Userduplicate(username, firstName, lastName, address, mobile, email, isAdmin);
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

	public Userduplicate getUserByUsername(String username) throws ClassNotFoundException {
		
		Userduplicate user = null;
		    String sql = "SELECT * FROM user WHERE Username = ?";
		    
		    try (Connection connection = DBConnection.initializeDatabase();
		         PreparedStatement statement = connection.prepareStatement(sql)) {
		        
		        statement.setString(1, username);
		        ResultSet resultSet = statement.executeQuery();
		        
	            if (resultSet.next()) {
	                String firstName = resultSet.getString("FirstName");
	                String lastName = resultSet.getString("LastName");
	                String address = resultSet.getString("Address");
	                String mobile = resultSet.getString("Mobile");
	                String email = resultSet.getString("Email");
	                boolean isAdmin = resultSet.getBoolean("Is_Admin");

	                user = new Userduplicate(username, firstName, lastName, address, mobile, email, isAdmin);
	            }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    
		    return user;
	}
	
}

