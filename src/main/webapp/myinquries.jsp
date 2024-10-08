<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.InfinityArcade.models.Inquary" %>
<%@ page import="com.InfinityArcade.util.InquireController" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" type="text/css" href="assets/css/dashboard.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <title>Infinity Arcade - Online Gaming Site</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="assets/images/favico.png">
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/infinityArcade-gaming.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
        <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
	<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
        <style>
        	.body-content{
			    margin: 0px 5% 5% 5%;
			}
            .headding {
                margin-top: 50px;
            }
            .inquariesContainer {
                border: 0.5px solid rgba(83, 83, 172, 0.425);
                border-radius: 5px;
                box-shadow: 0 5px 10px rgba(0,0,0,0.5);
                max-width: 100%;
                padding: 10px 10px 50px 10px;
                background-color: #d8d9d85f;
                margin-bottom: 50px;
                margin-top: 70px;
            }
            h1 {
                text-align: left;
            }
            table {
                border: 1px solid #c4c4c4;
                background-color: #fff;
                border-radius: 5px;
                width: 100%;
                
            }
            .inquaryList {
                max-height: 300px;
                overflow-y: scroll;
                border-radius: 5px;
            }
            th {
                position: sticky;
                top: 0px;
                background-color: #ed6197;
                padding: 10px;
                width:calc(100% / 6);
            }
            #selectCheckBox {
                width:50px
            }
            td {
                text-align: center;
                padding: 10px;
            }
            td label {
                display: inline-block;
                padding: 5px 10px;
            }
            tr {
                transition: background-color 0.3s ease;
            }
            tr:hover {
                background-color: #f0f0f0;
            }
            .Controllers {
                text-align: center;
                align-items: center;
            }
            #editBtn , #delBtn {
                background-color: #ed6197;
                color: #fff;
                font-weight: 500;
                padding: 10px;
                border-radius: 5px;
                cursor: pointer;
                transition: all 0.2s ease;
            }
            #delBtn {
                background-color: red;
            }
            #editBtn:hover , #delBtn:hover {
                opacity: 0.9;
            }
            #editBtn:active , #delBtn:active {
                transform: scale(0.9);
            }
        </style>
    </head>
    <body>
     <jsp:include page="assets/config/header.jsp" />
     
     <%
        List<Inquary> Inquaries = InquireController.readAllInquary((String) session.getAttribute("username")); 
      %>

    <div class="page-heading header-text">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3>My Inquaries</h3>
                    <span class="breadcrumb"><a href="index.jsp">Home</a> > <a href="shop.jsp"> User Dashboard</a> > My Inquaries </span>
                </div>
            </div>
        </div>
    </div>
    <div class="body-content">
    <div class="userDashboardMenu">
                <div class="user">
                    <div class="profilePic">
                        <img src="../images/userProfilePic.jpeg" alt="user">
                    </div>
                    <div class="userName">
                        <span><%= (String)session.getAttribute("fname") %> <%= (String)session.getAttribute("lname") %></span>
                    </div>
                </div>
                <div class="navList">
                    <ul class="linkList">
                        <li onclick="loadContent('myinfo');">Profile Information</li>
                        <li onclick="loadContent('inquary');">My Inquaries</li>
                        <li style="background-color: rgba(125, 23, 41, 0.81); color:#fff" onclick=" if(window.confirm('Do you want to Delete Your Account?')){document.location = '';}"> Delete Account </li>
                        <li style="background-color: #f00;color:#fff" onclick="if(window.confirm('Do you want to Sign Out?')){document.location = '';}" id="logout"> Sign Out </li>
                    </ul>
                </div>
      </div>
      <div class='content'>
            <div class="inquariesContainer">
                <h3>Inquaries</h3>
                <div class="inquaryListWrapper">
                    <div class="inquaryList">
                        <table>
                            <tr>
                                <th>
                                    Inquary ID
                                </th>
                                <th>
                                    Name
                                </th>
                                <th>
                                    Email
                                </th>
                                <th>
                                    Subject
                                </th>
                                <th>
                                    Message
                                </th><th>
                                    Controllers
                                </th>
                            </tr>
                            
                            <%
			                    for (Inquary inq : Inquaries) {
			                %>
			                
				                <tr class="Inqary">
				                    <td>
				                        <label for="Inqary"><%= inq.getinquaryID() %></label>
				                    </td>
				                    <td>
				                        <label for="Inqary"><%= inq.getname() %> </label>
				                    </td>
				                    <td>
				                        <label for="Inqary"><%= inq.getEmail() %> </label>
				                    </td>
				                    <td>
				                        <label for="Inqary"><%= inq.getSubject() %> </label>
				                    </td>
				                    <td>
				                        <label for="Inqary"><%= inq.getmessage() %> </label>
				                    </td>
				                    <td class="Controllers">
				                        <button id="editBtn" onclick="if(window.confirm('Do you want to Edit this Inquary?')){
				                            document.location = 'contact.jsp?inquaryID=<%= inq.getinquaryID() %>';};"> Edit </button>
				
				                        <button id="delBtn" onclick="if(window.confirm('Do you want to Delete this Inquary?')){document.location = 'DeleteInquary?inquaryID=<%= inq.getinquaryID() %>';};">Delete </button>
				                    </td>
				                </tr>
			                <%
			                    }
			                %>
                        </table>
                    </div>
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