<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%
    // Check if the user is already logged in
    if (session.getAttribute("username") != null) {
        response.sendRedirect("index.jsp");
        return; // Prevent further processing
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="assets/css/signOperations.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Infinity Arcade - Online Gaming Site</title>

    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/infinityArcade-gaming.css">
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
          <h3>Sign In</h3>
          <span class="breadcrumb"><a href="index.jsp">Home</a>  >  Sign In</span>
        </div>
      </div>
    </div>
  </div>
    
    <div class="body-content">
        <div class="image">
            <img src="" alt="signIn image">
        </div>
        <div class="form">
            <form method="post" action="SignInServlet">
                <label>Username:</label>
                <input type="text" id="username" name="username" placeholder="Username" pattern="[A-Z a-z 0-9]{4,12}" required>
                
                <label>Password:</label>
                <input type="password" id="pwd" name="pwd" placeholder="Password" pattern="[a-z A-Z 0-9 \. @ % #]{8,}" required>
                
                <%
				    String errorMsg = (String) request.getAttribute("errorMsg");
				%>
				
				<% if (errorMsg != null && !errorMsg.isEmpty()) { %>
				    <span id="err">&#9888; <%= errorMsg %></span>
				<% } %>

                
                <div class="submitButton">
                    <a href="signup.jsp">Do you want to create an Account?</a>
                    <input type="submit" value="Sign In" name="SignIn">
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="assets/config/footer.jsp" />
    
      <!-- Scripts -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/custom.js"></script>
</body>
</html>
