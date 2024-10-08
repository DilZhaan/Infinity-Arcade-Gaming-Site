<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="java.util.List" %>
<%@ page import="com.InfinityArcade.models.Userduplicate" %>
<%@ page import="com.InfinityArcade.util.UserDAOduplicate" %>

<%
    UserDAOduplicate userDAOD = new UserDAOduplicate();
    List<Userduplicate> listUsers = userDAOD.listUsers();
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
                    <span class="breadcrumb"><a href="index.jsp">Home</a>  >  Sign In</span>
                </div>
            </div>
        </div>
    </div>

    <div class="body-content">
        <div class="userDashboardMenu">
            <div class="user">
                <div class="profilePic">
                    <img src="assets/images/userProfilePic.jpeg" alt="user">
                </div>
            </div>
            <div class="navList">
                <ul class="linkList">
                    <li onclick=""> Reports</li>
                    <li onclick="document.location = 'Review.jsp';"> Reviews</li>
                    <li onclick="document.location = 'UserManagement.jsp';"> User Management </li>
                    <li onclick="document.location = 'AdminProfile.jsp';"> Profile Informations </li>
                    <li style="background-color: rgba(125, 23, 41, 0.81); color:#fff" 
                        onclick=" if(window.confirm('Do you want to Delete Your Account?')){document.location = 'WEB-INF/DeleteAccount.jsp';}">
                        Delete Account 
                    </li>
                    <li style="background-color: #f00;color:#fff" 
                        onclick=" if(window.confirm('Do you want to Sign Out?')){document.location = 'WEB-INF/SignOut.jsp';}">
                        Sign Out
                    </li>
                </ul>
            </div>
        </div>

        <div class="content">
            <div class="basics">
                <div class="tusers">
                    <h3>Total Users<br><span>100</span></h3>
                </div>
                <div class="susers">
                    <h3>Staff Users<br><span>20</span></h3>
                </div>
                <div class="members">
                    <h3>Members<br><span>80</span></h3>
                </div>
                <div class="iusers">
                    <h3>Inactive Users<br><span>0</span></h3>
                </div>
            </div>

            <div class="userlistJ">
                <div class="userList">
                    <h2>User List</h2>

                    <!-- Add Members button -->
                    <div class="addmem">
            <button onclick="document.location = 'UserServletduplicate?action=new';">Add Members</button>
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
								        
								        
                                    <a href="UserServletduplicate?action=edit&username=<%= user.getUsername() %>">
                                        <button class="btn btn-primary">Update</button>
                                    </a>
                                    
                                    <form action="UserServletduplicate?action=delete" method="post" style="display:inline;">
                                        <input type="hidden" name="username" value="<%= user.getUsername() %>">
                                        <button type="submit" class="btn btn-danger">Delete</button>
                                    </form>
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
