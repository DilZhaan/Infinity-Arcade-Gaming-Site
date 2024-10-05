<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.InfinityArcade.models.*" %>
<%@ page import="com.InfinityArcade.util.GameManager" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <title>Infinity Arcade - Online Gaming Site</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/infinityArcade-gaming.css">
    <link rel="icon" type="image/x-icon" href="assets/images/favico.png">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
</head>

<body>

    <jsp:include page="assets/config/header.jsp" /> <!-- header -->

    <%
        List<Game> games = GameManager.getAllGames(); // Retrieve all games from the database or in-memory store
    %>

    <div class="page-heading header-text">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3>Our Shop</h3>
                    <span class="breadcrumb"><a href="index.jsp">Home</a> > Our Shop</span>
                </div>
            </div>
        </div>
    </div>

    <div class="section trending">
        <div class="container">
            <ul class="trending-filter">
                <li>
                    
                    
                    <%
                        Integer isAdmin = (Integer) session.getAttribute("is_admin");
                        if (isAdmin != null && isAdmin == 1) {
                    %>
                    <a href="newgame.jsp"  > + Add New Game </a>
                    <%
                        } else {
                    %>
                        <a class="is_active" href="#!" >Show All</a>
                    <%
                        }
                    %>
                </li>
            </ul>
            <div class="row trending-box">
                <%
                    for (Game game : games) {
                %>
                <div class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 adv">
                    <div class="item">
                        <div class="thumb">
						    <a href="product-details.jsp?gameID=<%= game.getGameID() %>">
						        <img src="<%= game.getImg() %>" alt="<%= game.getGameName() %>" class="thumbnail-img">
						    </a>
						    <span class="price">$<%= game.getPrice() %></span>
						</div>

                        <div class="down-content">
                            <span class="category"><%= game.getGenre() %></span>
                            <h4><%= game.getGameName() %></h4>

                            <%
                                if (isAdmin != null && isAdmin == 1) {
                            %>
                                <a href="newgame.jsp?gameID=<%= game.getGameID() %>" class="edit-button" style="margin-right: 60px;"><i class="fa fa-edit"></i></a>
                                <a href="DelGame?gameID=<%= game.getGameID() %>" class="delete-button" onclick="return confirm('Are you sure you want to delete this game?');">
       								<i class="fa fa-trash"></i>
       							</a>
                            <%
                                } else {
                            %>
                                <a href="product-details.jsp?gameID=<%= game.getGameID() %>" id="bag"><i class="fa fa-shopping-bag"></i></a>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>

    <jsp:include page="assets/config/footer.jsp" /> <!-- Footer -->

    <!-- Scripts -->
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/isotope.min.js"></script>
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/counter.js"></script>
    <script src="assets/js/custom.js"></script>
    <script>
        document.getElementById('shop').setAttribute('class','active');
    </script>
</body>
</html>
