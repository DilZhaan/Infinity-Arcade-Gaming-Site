<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.InfinityArcade.models.Userduplicate" %>
<%@ page import="com.InfinityArcade.util.UserDAOduplicate" %>


<%
	Userduplicate user = null;
		//Check if the user is NOT logged in
		if (session.getAttribute("username") == null) {
			 response.sendRedirect("signIn.jsp");
			 return; // Prevent further processing
		} else {
		 user = UserDAOduplicate.getUserByUsername((String) session.getAttribute("username"));
		}

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin_Profile Information</title>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   

     
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/infinityArcade-gaming.css">
    <link rel="stylesheet" href="assets/css/generalStyle.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
</head>
<body>

	  <jsp:include page="assets/config/header.jsp" />
    <div class="page-heading header-text">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <h3>Profile Information</h3>
          <span class="breadcrumb"><a href="index.jsp">Home</a>  >  User Profile</span>
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
                

                <h1 class="headding">    </h1>
                <div class="userDetailContainer">
                    <h2>User Details</h2>
                    <div class="udForm">
                        <form action="UserServletduplicate" method="POST">
                                    <div class="formElement">
                                        <label>First Name : </label>
                                            <input type="text" id="fname" name="fname" placeholder="First Name" pattern="[A-Z][a-z]+" value="<%= (user != null) ? user.getFirstName() : "" %>" readonly>
                                    </div>
                                    <div class="formElement">
                                        <label>Last Name :</label>
                                            <input type="text" id="lname" name="lname" placeholder="Last Name" pattern="[A-Z][a-z]+" value="<%= (user != null) ? user.getLastName() : "" %>"readonly>
                                    </div>
                                    <div class="formElement">
                                        <label>Address :</label>
                                            <input  type="text" id="address" name="address" placeholder="Address" value="<%= (user != null) ? user.getAddress() : "" %>"readonly>
                                    </div>
                                    <div class="formElement">
                                        <label>Mobile No :</label>
                                            <input type="text" id="mobile" name="mobile" placeholder="Mobile Number" pattern="[\+][0-9]{10,}" value="<%= (user != null) ? user.getMobile() : "" %>"  readonly>
                                    </div>
                                    <div class="formElement">
                                        <label>E-mail :</label>
                                            <input type="email" id="mail" name="mail" placeholder="E-mail" value="<%= (user != null) ? user.getEmail() : "" %>"readonly>
                                    </div>
                        </form>
                    </div>
                </div>
                
                </div>
        </div>
   <jsp:include page="assets/config/footer.jsp" />
    
   
    </body>




        <style>
            .headding {
                margin-top: 50px;
            }
            .userDetailContainer , .accDetailContainer {
                border: 0.5px solid rgba(83, 83, 172, 0.425);
                border-radius: 5px;
                box-shadow: 0 5px 10px rgba(0,0,0,0.5);
                max-width: 100%;
                padding: 10px 10px 50px 10px;
                background-color: #d8d9d85f;
                margin-bottom: 50px;
            }
            h1,h2 {
                text-align: left;
            }
            .content {
                width: calc(100% - 320px);
            }
            .formElement {
                display: block;
            }
            .formElement > label ,.formElement > input{
                display: inline-block;
                padding: 10px;
            }
            .formElement > label {
                width: 200px;
            }
            .formElement > input {
                box-shadow: 0px 5px 10px 0px rgba(0,0,0,0.2);
                border-radius: 5px;
                margin:10px;
                width: 300px;
                justify-content: center;
            }
            .submitButton {
                display: flex;
                justify-content: flex-end;
                padding: 10px 20px;
            }
            .submitButton > input {
                padding: 10px 30px ;
                background-color: #007bff;
                color: #fff;
                border: none;
                cursor: pointer;
            }
            .submitButton > input:disabled {
                background-color: #278af4d2;
            }
        </style>

        <style>
        .body-content {
    display: flex;
    justify-content: space-between;
}

.userDashboardMenu {
    margin-top: 50px;
    border-radius: 5px;
    background-color: #eaecea;
    box-shadow: 0px 5px 15px 0px rgba(0,0,0,0.3);
    width: 300px;
    height: 100%;
    padding: 30px;
}
.user {
    display: inline;
}
.profilePic > img{
    display: block;
    margin-left: auto;
    margin-right: auto;
    height: 200px;
    border-radius: 100%;
}

.userName > span {
    font-weight: 900;
    font-size: larger;
    display: flex;
    justify-content: center;
    margin-top: 10px;
}

.userBio{
    margin-top: 5px;
    text-align: justify;
    font-size: small;
}

.navList {
    margin-top: 30px;
}
.linkList{
    list-style: none;
}

.linkList li {
    background-color: #fff;
    border-radius: 5px;
    padding: 10px;
    margin: 7px 15px 7px 15px;
    text-align: center;
    cursor: pointer;
    font-weight: 600;
    color: black;
    box-shadow: 0 5px 10px rgba(30, 113, 54, 0.2);
}

.linkList li:hover {
    border: 0.5px solid #474fc6a1;
    box-shadow: 0 5px 10px rgba(197, 101, 101, 0.488);
}

.content {
    max-width: calc(100% - 320px);
    width: 100%;
}
        </style>
</html>