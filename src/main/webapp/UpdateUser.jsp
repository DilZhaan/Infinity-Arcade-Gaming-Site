<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
	  <jsp:include page="assets/config/header.jsp" />
    <div class="page-heading header-text">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <h3>Update User</h3>
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
                       

                        <li style="background-color: rgba(125, 23, 41, 0.81); color:#fff" onclick=" if(window.confirm('Do you want to Delete Your Account?')){document.location = 'WEB-INF/DeleteAccount.jsp';}"> Delete Account </li>

                        <li style="background-color: #f00;color:#fff" onclick=" if(window.confirm('Do you want to Sign Out?')){document.location = 'WEB-INF/SignOut.jsp';}"> Sign Out </li>
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
        <form action="SignIn.java" method="POST">
            <div class="form-group">
                <label for="uname">UserName</label>
                <input type="text" id="uname" name="uname" placeholder="Username" required>
            </div>
            <div class="form-group">
                <label for="fname">First Name</label>
                <input type="text" id="fname" name="fname" placeholder="First Name" pattern="[A-Z][a-z]+" value="${fname}"required>
            </div>
            <div class="form-group">
                <label for="lname">Last Name</label>
                <input type="text" id="lname" name="lname" placeholder="Last Name" pattern="[A-Z][a-z]+" value="${lname}"required>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <input  type="text" id="address" name="address" placeholder="Address" value="${address}"required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="mail" name="mail" placeholder="E-mail" value="${email}" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="phone" id="mobile" name="mobile" placeholder="Mobile Number" pattern="[\+][0-9]{10,}" value="${phonenum}" required>
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
                <button type="submit" name="save_btn" >Update User</button>
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