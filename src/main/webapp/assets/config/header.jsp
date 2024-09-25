<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<header class="header-area header-sticky">
  <div class="container">
      <div class="row">
          <div class="col-12">
              <nav class="main-nav">
                  <a href="index.html" class="logo">
                      <img src="assets/images/logo.png" alt="" style="width: 158px;">
                  </a>
                  <ul class="nav">
                    <li><a href="index.jsp" id="home">Home</a></li>
                    <li><a href="shop.jsp" id="shop">Our Shop</a></li>
                    <li><a href="about.jsp" id="about">About Us</a></li>
                    <li><a href="contact.jsp" id="contact">Contact Us</a></li>
                    

					<%
                          // Check if the user is logged in
                          String username = (String) session.getAttribute("username");
                          Integer isAdmin = (Integer) session.getAttribute("is_admin");

                          if (username == null) {
                      %>
                              <li><a href="#" id="signUp">Sign up</a></li>
                              <li><a href="signIn.jsp" id="signIn">Sign In</a></li>
                      <%
                          } else {
                              // User is logged in
                              if (isAdmin != null && isAdmin == 1) {
                      %>
                                  <li><a href="#" id="adminDashboard">Admin Dashboard</a></li>
                      <%
                              } else {
                      %>
                                  <li><a href="#" id="userDashboard">User Dashboard</a></li>
                      <%
                              }
                          }
                      %>
                    
                    
                    
                </ul>   
                  <a class='menu-trigger'>
                      <span>Menu</span>
                  </a>
              </nav>
          </div>
      </div>
  </div>
</header>