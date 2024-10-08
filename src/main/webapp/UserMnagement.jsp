<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="java.util.List" %>
<%@ page import="com.InfinityArcade.models.Userduplicate" %>
<%@ page import="com.InfinityArcade.util.UserDAOduplicate" %>

<%
	if(session.getAttribute("username") == null ){
		response.sendRedirect("signIn.jsp");
        return;
	}
	if((Integer)session.getAttribute("is_admin") == 0){
		response.sendRedirect("UserProfile.jsp");
	    return;
	}
    List<Userduplicate> listUsers = UserDAOduplicate.listUsers();
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/infinityArcade-gaming.css">
    
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    
    <link rel="stylesheet" href="assets/css/usermanagement.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/generalStyle.css">
    <link rel="stylesheet" href="assets/css/dashboard.css">
    

    
    <title>userManagement</title>
</head>

<body>

    <jsp:include page="assets/config/header.jsp" />
    
    <div class="page-heading header-text">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3>User Management</h3>
                    <span class="breadcrumb"><a href="index.jsp">Home</a>  >  User Management</span>
                </div>
            </div>
        </div>
    </div>

    <div class="body-content">
        <div class="userDashboardMenu">
                
                <div class="navList">
                    <ul class="linkList">
                        <li onclick="document.location = 'myinquries.jsp';"> My Inquiry</li>
                        
                         <% if ((Integer)session.getAttribute("is_admin") == 1) { %>
		                
		                <li onclick="document.location = 'UserMnagement.jsp';"> User Management</li>
		                
		                
		            	<% }
                         %>
		            	
		                
		                <li onclick="document.location = 'UserProfile.jsp';"> Profile Information</li>
		            	
                    </ul>
                </div>
            </div>

        <div class="content">
            

            <div class="userlistJ">
                <div class="userList">
                    <h2>User List</h2>

                    <!-- Add Members button -->
                    <div class="addmem">
            <button onclick="document.location = 'AddUser.jsp';">Add Members</button>
       			 	</div>

                    <table class="table table-hover table-dark">
                        <thead>
                            <tr>
                                <th scope="col">FirstName</th>
                                <th scope="col">LastName</th>
                                <th scope="col">UserName</th>
                                <th scope="col">UserType</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                                <%
       							 for (Userduplicate user : listUsers) {
   								 %>
                            
                            <tr>
                                        <td><%= user.getUsername() %></td>
								        <td><%= user.getFirstName() %></td>
								        <td><%= user.getLastName() %></td>
								        <td><%= user.isAdmin() ? "Admin" : "User" %><td>
								        
								        
                                        <button onclick="document.location ='UpdateUser.jsp?username=<%= user.getUsername() %>'" class="btn btn-primary">Update</button>
                        
                                    
                                        <button onclick="if(window.confirm('Do you want to Delete this User?')){document.location = 'DelUser?username=<%= user.getUsername() %>';};" class="btn btn-danger">Delete</button>

                                </td>
                            </tr>
                                <%
							        }
							    %>
                            <!-- Add more rows as needed -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
   </div>
    

     <jsp:include page="assets/config/footer.jsp" />

    <!-- Scripts -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/custom.js"></script>
    
</body>
</html>
