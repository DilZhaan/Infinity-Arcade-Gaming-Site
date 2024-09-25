package com.InfinityArcade.Servelet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.InfinityArcade.util.DBConnection;
@WebServlet("/SignInServlet")
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String username = request.getParameter("username");
	        String password = request.getParameter("pwd");

	        Connection conn = null;
	        PreparedStatement stmt = null;
	        ResultSet rs = null;

	        try {
	            conn = DBConnection.initializeDatabase();

	            String query = "SELECT Username, Is_Admin, Email, FirstName, LastName FROM User WHERE Username = ? AND Password = ? LIMIT 1";
	            stmt = conn.prepareStatement(query);
	            stmt.setString(1, username);
	            stmt.setString(2, password);

	            rs = stmt.executeQuery();

	            if (rs.next()) {
	                // Successful login
	                HttpSession session = request.getSession();
	                session.setAttribute("username", rs.getString("Username"));
	                session.setAttribute("fname", rs.getString("FirstName"));
	                session.setAttribute("lname", rs.getString("LastName"));
	                session.setAttribute("email", rs.getString("Email"));
	                session.setAttribute("is_admin", rs.getInt("Is_Admin"));

	                response.sendRedirect("index.jsp");
	                
	            } else {
	                // Invalid login
	                request.setAttribute("errorMsg", "Invalid Login Information!");
	                request.getRequestDispatcher("signIn.jsp").forward(request, response);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("SignIn.jsp");
	        } finally {
	            try {
	                if (rs != null) rs.close();
	                if (stmt != null) stmt.close();
	                if (conn != null) conn.close();
	            } catch (SQLException se) {
	                se.printStackTrace();
	            }
	        }
	}

}
