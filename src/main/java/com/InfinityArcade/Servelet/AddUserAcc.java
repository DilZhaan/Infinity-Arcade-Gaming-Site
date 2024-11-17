package com.InfinityArcade.Servelet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.InfinityArcade.models.Userduplicate;
import com.InfinityArcade.util.UserDAOduplicate;

/**
 * Servlet implementation class AddUserAcc
 */
@WebServlet("/AddUserAcc")
public class AddUserAcc extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("uname");
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String address = request.getParameter("address");
        String mobile = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        String isAdminParam = request.getParameter("is_admin");
        boolean isAdmin = isAdminParam != null && isAdminParam.equalsIgnoreCase("1");


        Userduplicate user = new Userduplicate(username, firstName, lastName, address, mobile, email, password, isAdmin);
        
        try {
        	UserDAOduplicate.addUser(user);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        response.sendRedirect("UserMnagement.jsp"); 
	}

}
