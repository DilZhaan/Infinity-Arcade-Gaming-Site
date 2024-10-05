<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.InfinityArcade.models.*" %>
<%@ page import="com.InfinityArcade.util.GameManager" %>

<%
	String gameID = request.getParameter("gameID");
    if (gameID == null) {
        response.sendRedirect("shop.jsp");
        return; // Prevent further processing
    }

    Game game = GameManager.getGame(gameID); 

%>
<!DOCTYPE html>
<html lang="en">

  <head>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Infinity Arcade - Online Gaming Site</title>

    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/infinityArcade-gaming.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="icon" type="image/x-icon" href="assets/images/favico.png">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

  </head>

<body>
	
  <jsp:include page="assets/config/header.jsp" />

  <div class="page-heading header-text">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <h3><%= game.getGameName() %> : <%= game.getGameTitle() %></h3>
          <span class="breadcrumb"><a href="#">Home</a>  >  <a href="shop.jsp">Shop</a>  > <%= game.getGameName() %></span>
        </div>
      </div>
    </div>
  </div>

  <div class="single-product section">
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <div class="left-image">
            <img src="<%= game.getImg() %>" alt="<%= game.getGameTitle() %>">
          </div>
        </div>
        <div class="col-lg-6 align-self-center">
          <h4><%= game.getGameName() %> : <%= game.getGameTitle() %></h4>
          <span class="price">$<%= game.getPrice() %></span>
          <p> <%= game.getDesc() %> </p>
          <%
          	 Integer isAdmin = (Integer) session.getAttribute("is_admin");
             if (isAdmin != null && isAdmin == 1) {
          %>
             <a href="newgame.jsp?gameID=<%= game.getGameID() %>" class="edit-button" style="margin-right: 60px;"><i class="fa fa-edit"></i>Edit Game</a>
             <a href="DelGame?gameID=<%= game.getGameID() %>" class="delete-button" onclick="return confirm('Are you sure you want to delete this game?');">
				<i class="fa fa-trash"></i> Delete Game
			</a>
              <%
             } else {
          %>
             <a href="<%= game.getLink() %>" id="bag"><i class="fa fa-download"></i>Download</a>
          <%
             }
          %> 
          <ul>
            <li><span>Game ID:</span> <%= game.getGameID() %></li>
            <li><span>Genre:</span> <%= game.getGenre() %></li>
            <li><span>Multi-tags:</span> <%= game.getTags() %> </li>
            <li><span>Uploaded Date:</span> <%= game.getUploadDate() %> </li>
            <li><span>Updated Date:</span> <%= game.getUpdatedDate() %> </li>
            <li><span>Developer:</span> <%= game.getDevName() %> </li>
          </ul>
        </div>
        <div class="col-lg-12">
          <div class="sep"></div>
        </div>
      </div>
    </div>
  </div>
<button class="review-button" onclick="window.location.href='Review.jsp?gameID=<%= game.getGameID() %>'">Leave a Review</button>

  <jsp:include page="assets/config/footer.jsp" />

  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/js/isotope.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>
  <script src="assets/js/counter.js"></script>
  <script src="assets/js/custom.js"></script>

  </body>
</html>