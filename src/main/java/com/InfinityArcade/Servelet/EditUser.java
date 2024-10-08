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
 * Servlet implementation class EditUser
 */
@WebServlet("/EditUser")
public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("uname");
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String address = request.getParameter("address");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("mail");

        String isAdminParam = request.getParameter("is_admin");
        boolean isAdmin = isAdminParam != null && isAdminParam.equalsIgnoreCase("1");


        
        Userduplicate updatedUser = new Userduplicate(username, firstName, lastName, address, mobile, email, isAdmin);
        
        try {
			UserDAOduplicate.updateUser(updatedUser);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        response.sendRedirect("UserMnagement.jsp");
	}

}
