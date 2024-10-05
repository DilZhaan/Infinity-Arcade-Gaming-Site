<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<%@ page import="com.InfinityArcade.models.*" %>
<%@ page import="com.InfinityArcade.util.GameManager" %>
<!DOCTYPE html>
<html>
<head>
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
	
	  <div class="main-banner">
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-6 align-self-center">
	          <div class="caption header-text">
	            <h6>Welcome to Infinity Arcade</h6>
	            <h2>BEST GAMING SITE EVER!</h2>
	            <p>Discover the ultimate collection of games at Infinity Arcade! From thrilling adventures to classic favorites, experience endless entertainment with easy access to all the top titles. Your next gaming journey starts here!</p>
	          </div>
	        </div>
	        <div class="col-lg-4 offset-lg-2">
	          <div class="right-image">
	            <img src="assets/images/banner-image.jpg" alt="">
	            <span class="price">$22</span>
	            <span class="offer">-100%</span>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	
	  <div class="features">
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-3 col-md-6">
	          <a href="#">
	            <div class="item">
	              <div class="image">
	                <img src="assets/images/featured-01.png" alt="" style="max-width: 44px;">
	              </div>
	              <h4>Free Storage</h4>
	            </div>
	          </a>
	        </div>
	        <div class="col-lg-3 col-md-6">
	          <a href="#">
	            <div class="item">
	              <div class="image">
	                <img src="assets/images/featured-02.png" alt="" style="max-width: 44px;">
	              </div>
	              <h4>User More</h4>
	            </div>
	          </a>
	        </div>
	        <div class="col-lg-3 col-md-6">
	          <a href="#">
	            <div class="item">
	              <div class="image">
	                <img src="assets/images/featured-03.png" alt="" style="max-width: 44px;">
	              </div>
	              <h4>Reply Ready</h4>
	            </div>
	          </a>
	        </div>
	        <div class="col-lg-3 col-md-6">
	          <a href="#">
	            <div class="item">
	              <div class="image">
	                <img src="assets/images/featured-04.png" alt="" style="max-width: 44px;">
	              </div>
	              <h4>Easy Layout</h4>
	            </div>
	          </a>
	        </div>
	      </div>
	    </div>
	  </div>
	
	  <div class="section trending">
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-6">
	          <div class="section-heading">
	            <h6>Trending</h6>
	            <h2>Trending Games</h2>
	          </div>
	        </div>
	        <%
	        		Integer isAdmin = (Integer) session.getAttribute("is_admin");
	        		List<Game> games = GameManager.getAllGames();
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
	
	  <div class="section cta">
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-5">
	          <div class="shop">
	            <div class="row">
	              <div class="col-lg-12">
	                <div class="section-heading">
	                  <h6>Our Shop</h6>
	                  <h2>Go Pre-Order Buy & Get Best <em>Prices</em> For You!</h2>
	                </div>
	                <p>Lorem ipsum dolor consectetur adipiscing, sed do eiusmod tempor incididunt.</p>
	                <div class="main-button">
	                  <a href="shop.html">Shop Now</a>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	        <div class="col-lg-5 offset-lg-2 align-self-end">
	          <div class="subscribe">
	            <div class="row">
	              <div class="col-lg-12">
	                <div class="section-heading">
	                  <h6>NEWSLETTER</h6>
	                  <h2>Get Up To $100 Off Just Buy <em>Subscribe</em> Newsletter!</h2>
	                </div>
	                <div class="search-input">
	                  <form id="subscribe" action="#">
	                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Your email...">
	                    <button type="submit">Subscribe Now</button>
	                  </form>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	
	  <jsp:include page="assets/config/footer.jsp" />
	
	  <!-- Scripts -->
	  <!-- Bootstrap core JavaScript -->
	  <script src="vendor/jquery/jquery.min.js"></script>
	  <script src="assets/js/isotope.min.js"></script>
	  <script src="assets/js/owl-carousel.js"></script>
	  <script src="assets/js/counter.js"></script>
	  <script src="assets/js/custom.js"></script>
	  
	  <script>
		document.getElementById('home').setAttribute('class','active');
	  </script>

</body>
</html>