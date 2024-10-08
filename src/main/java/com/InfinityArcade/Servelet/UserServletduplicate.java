package com.InfinityArcade.Servelet;



import java.io.IOException;
import java.util.List;

import com.InfinityArcade.models.Userduplicate;
import com.InfinityArcade.util.UserDAOduplicate;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

 


@WebServlet("/UserServletduplicate")
public class UserServletduplicate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserDAOduplicate userDAOD;
       

    public UserServletduplicate() {
        this.userDAOD= new UserDAOduplicate();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.doGet(request, response);
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
	    if (action == null) {
	        action = "list"; // default action if no action is specified
	    }
		
	        switch (action) {
	        case "new":
	        	showNewForm(request,response);
	        	break;
	        case "add":
	        	try {
					addUser(request,response);
				} catch (ClassNotFoundException | ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            break;
	        case "edit":
	        	try {
					showEditForm(request,response);
				} catch (ClassNotFoundException | ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            break;
	        case "update":
	        	try {
					updateUser(request,response);
				} catch (ClassNotFoundException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            break;
	        case "delete":
	        	try {
					deleteUser(request,response);
				} catch (ClassNotFoundException | ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            break;
	        case "list":
	        	
	        default:
	        	try {
					listUsers(request,response);
				} catch (ClassNotFoundException | ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            break;
	    }
		
}
	
    private void showNewForm (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("AddUser.jsp");
        dispatcher.forward(request, response);
    }
    
    private void addUser (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException{
    	
    	String username = request.getParameter("username");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean isAdmin = Boolean.parseBoolean(request.getParameter("isAdmin"));

        Userduplicate user = new Userduplicate(username, firstName, lastName, address, mobile, email, password, isAdmin);
        try {
			userDAOD.addUser(user);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        response.sendRedirect("UserServletduplicate?action=list"); 
    }
    
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
    	
        String username = request.getParameter("username");
        userDAOD.deleteUser(username);
        response.sendRedirect("UserServletduplicate?action=list");
    	
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
        String username = request.getParameter("username");
        Userduplicate existingUser = userDAOD.getUserByUsername(username);

        request.setAttribute("user", existingUser);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateUser.jsp");
        dispatcher.forward(request, response);
    }
    
    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException {
        String username = request.getParameter("username");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        boolean isAdmin = Boolean.parseBoolean(request.getParameter("isAdmin"));

        Userduplicate updatedUser = new Userduplicate(username, firstName, lastName, address, mobile, email, isAdmin);
        
        userDAOD.updateUser(updatedUser);
        
        response.sendRedirect("UserServlet?action=list");
    }
    
    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
    	
        List<Userduplicate> listUsers = userDAOD.listUsers();
        request.setAttribute("listUsers", listUsers);
        request.getRequestDispatcher("UserMnagement.jsp").forward(request, response);
    }
    
}
