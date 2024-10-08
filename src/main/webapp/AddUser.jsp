<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    <link rel="stylesheet" href="assets/css/usermanagement.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/generalStyle.css">
    <link rel="stylesheet" href="assets/css/dashboard.css">
    <link rel="stylesheet" href="assets/css/infinityArcade-gaming.css">
    
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    <title>Add user</title>
    
  </head>


<body>
    
	  <jsp:include page="assets/config/header.jsp" />
    <div class="page-heading header-text">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <h3>Add User</h3>
          <span class="breadcrumb"><a href="index.jsp">Home</a>  >  Add User</span>
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
        <h2>Add User</h2>
        <form action="AddUserAcc" method="POST">
            <div class="form-group">
                <label for="uname">UserName</label>
                <input type="text" id="uname" name="uname" required>
            </div>
            <div class="form-group">
                <label for="fname">First Name</label>
                <input type="text" id="fname" name="fname" required>
            </div>
            <div class="form-group">
                <label for="lname">Last Name</label>
                <input type="text" id="lname" name="lname" required>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <textarea id="address" name="address" required></textarea>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="number" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="is_admin">Is_Admin</label>
                <input type="number" id="is_admin" name="is_admin" required>
            </div>
            <div class="form-group" id="blabtn">
                <button type="submit" name="save_btn" >Add User</button>
            </div>
        </form>
    </div>

    <div class="userlistJ">
        <div class="userList">
            <h2>User List</h2>
            <table class="table table-hover table-dark">
                <thead>
                    <tr>

                        <th scope="col">FirstName</th>
                        <th scope="col">LastName</th>
                        <th scope="col">UserName</th>
                        <th scope="col">UserType</th>
                        <th scope="col"> <div class="addmem" onclick="toggleForm()"><button>Add Members</button></div>
                        </th>
                        

                    </tr>
                </thead>
                        <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <a href="UpdateUser.jsp">
                            <button class="btn btn-primary">Update</button>
                        </a>
                        <form action="deleteUser.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="userId" value="1">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
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