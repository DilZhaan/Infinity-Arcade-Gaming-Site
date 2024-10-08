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
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
     <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/infinityArcade-gaming.css">
    <link rel="stylesheet" href="assets/css/usermanagement.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/generalStyle.css">
    <link rel="stylesheet" href="assets/css/dashboard.css">
    
   
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    <title>Update User</title>
    
  </head>


<body>
<%
	String userID = request.getParameter("username");
	Userduplicate user = UserDAOduplicate.getUserDetails(userID); 

%>
    
	  <jsp:include page="assets/config/header.jsp" />
    <div class="page-heading header-text">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <h3>Update User</h3>
          <span class="breadcrumb"><a href="index.jsp">Home</a>  >  Update User</span>
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

    

    <div class="form-container">
        <h2>Update User</h2>
        <form action="EditUser" method="POST">
            <div class="form-group">
                <label for="uname">UserName</label>
                <input type="text" id="uname" name="uname" placeholder="Username" value="<%= (user != null) ? user.getUsername() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="fname">First Name</label>
                <input type="text" id="fname" name="fname" placeholder="First Name" pattern="[A-Z][a-z]+" value="<%= (user != null) ? user.getFirstName() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="lname">Last Name</label>
                <input type="text" id="lname" name="lname" placeholder="Last Name" pattern="[A-Z][a-z]+" value="<%= (user != null) ? user.getLastName() : "" %>"required>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <input  type="text" id="address" name="address" placeholder="Address" value="<%= (user != null) ? user.getAddress() : "" %>"required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="mail" name="mail" placeholder="E-mail" value="<%= (user != null) ? user.getEmail() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" id="mobile" name="mobile" placeholder="Mobile Number" pattern="[\+][0-9]{10,}" value="<%= (user != null) ? user.getMobile() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="is_admin">Is_Admin</label>
                <input type="number" id="is_admin" name="is_admin" value="<%= (user != null) ? user.isAdmin() : "" %>" required>
            </div>
            <div class="form-group" id="blabtn">
                <button type="submit" name="save_btn" >Update User</button>
            </div>
        </form>
    </div>

   
        </div>
    </div>




      <jsp:include page="assets/config/footer.jsp" />

    <!-- Scripts -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/custom.js"></script>
    
</body>

<style>

            .form-group > label ,.form-group > input{
                display: inline-block;
                padding: 10px;
            }
            .form-group > label {
                width: 200px;
            }
            .form-group > input {
                box-shadow: 0px 5px 10px 0px rgba(0,0,0,0.2);
                border-radius: 5px;
                margin:10px;
                width: 300px;
                justify-content: center;
            }
</style>

</html>