<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.InfinityArcade.models.*" %>
<%@ page import="com.InfinityArcade.util.GameManager" %>

<%
	String gameID = request.getParameter("gameID");
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
    <link rel="stylesheet" href="assets/css/animate.css">
    <style>
		/* General Styles */
		body {
		    font-family: 'Poppins', sans-serif;
		    background-color: #f8f9fa;
		    color: #343a40;
		}
		
		#container {
		    margin-top: 30px;
		}
		
		/* Style the form layout to match the image */
		form {
		    background-color: white;
		    padding: 20px;
		    border-radius: 8px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    display: flex;
		    justify-content: space-between;
		}
		
		form .row {
		    display: flex;
		    width: 100%;
		}
		
		form .col-md-6 {
		    padding: 10px;
		    box-sizing: border-box;
		}
		
		/* Adjustments for file input and image preview */
		#blah {
		    display: block;
		    width: 100%; 
		    height: 400px; 
		    text-align: center;
		    height:100%;
		    margin-top:10px;
		}
		.form-group {
		    margin-top: 10px;
		}
		.form-control {
		    padding: 10px 10px 10px;
		}
		.form-control-file {
		    width: 100%;
		    padding: 10px;
		    border: 1px solid #ced4da;
		    
		    border-radius: 10px;
		}
		
		.form-control-file:focus {
		    border-color: #007bff;
		    box-shadow: 0 0 5px rgba(0, 123, 255, .5);
		}
		
		.btn-primary {
		    background-color: #007bff;
		    border-color: #007bff;
		    width: 100%;
		}
		.image-preview {
		    position: relative;
		    width: 100%; 
		    height: 500px; 
		    min-height: 500px;
		    border: 1px solid #ced4da; 
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    border-radius: 10px;
		    margin-bottom: 10px;
		}
		
		
		#image-placeholder {
		    position: absolute;
		    font-size: 14px;
		    color: gray;
		    text-align: center;
		    display: none; 
		}
		
		/* Responsive styles */
		@media (max-width: 768px) {
		    form {
		        flex-direction: column;
		    }
		}

    </style>
    <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
	<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
    
</head>

<body>

    <jsp:include page="assets/config/header.jsp" />

    <div class="page-heading header-text">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3>Add New Game</h3>
                    <span class="breadcrumb"><a href="index.jsp">Home</a> > <a href="shop.jsp">Our Shop</a> > Add New Game </span>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container mt-5" id="container">
    <form id="addGameForm" method="post" action="<%= (game == null) ? "AddGame" : "EditGame" %>" enctype="multipart/form-data">
        <div class="row">
            <!-- Left Section: Image Preview and File Input -->
            <div class="col-md-6">
                <div class="form-group">
                    <label for="coverImage">Game Cover Image</label>
                    <div class="image-preview">
					    <img id="blah" src="#" alt="your image" onerror="this.onerror=null; this.src='';"  draggable="false" />
					    <span id="image-placeholder">Preview</span>
					</div>
                    <input type="file" class="form-control-file" id="coverImage" name="img" accept=".jpg, .jpeg, .png, .gif" onchange="readURL(this);" required/>
                </div>
            </div>

            <!-- Right Section: Form Inputs -->
            <div class="col-md-6">
                <div class="form-group">
                    <label for="gameID">Game ID</label>
                    <input type="text" class="form-control" id="gameID" name="gameID" value="<%= (game != null) ? game.getGameID() : "" %>" placeholder="Enter Game ID" <%= (game != null) ? "readonly" : "required" %>>

                </div>
                <div class="form-group">
                    <label for="gameName">Game Name</label>
                    <input type="text" class="form-control" id="gameName" name="gameName"  value="<%= (game != null) ? game.getGameName() : "" %>" placeholder="Enter Game Name" required>
                </div>
                <div class="form-group">
                    <label for="gameTitle">Game Title</label>
                    <input type="text" class="form-control" id="gameTitle" name="gameTitle" value="<%= (game != null) ? game.getGameTitle() : "" %>" placeholder="Enter Game Title" required>
                </div>
                <div class="form-group">
                    <label for="desc">Description</label>
                    <textarea class="form-control" id="desc" name="desc" placeholder="Enter Game Description" required><%= (game != null) ? game.getDesc() : "" %></textarea>
                </div>
                <div class="form-group">
                    <label for="devName">Deverloper</label>
                    <input type="text" class="form-control" id="devName" name="devName" placeholder="Enter Deverloper Name" value="<%= (game != null) ? game.getDevName() : "" %>" required>
                </div>
                <div class="form-group">
                    <label for="price">Price</label>
                    <input type="text" class="form-control" id="price" name="price" value="<%= (game != null) ? game.getPrice() : "" %>" placeholder="$0.00" required>
                </div>
                <div class="form-group">
                    <label for="genre">Genre</label>
                    <input type="text" class="form-control" id="genre" name="genre" value="<%= (game != null) ? game.getGenre() : "" %>" placeholder="Enter genre (e.g., Action, Adventure)" required>
                </div>
                <div class="form-group">
                    <label for="tags">Multi-tags</label>
                    <input type="text" class="form-control" id="tags" name="tags" value="<%= (game != null) ? game.getTags() : "" %>" placeholder="Enter tags separated by commas" required>
                </div>
                <button type="submit" class="btn btn-primary mt-3"><%= (game == null) ? "Add Game" : "Edit Game" %></button>
            </div>     
        </div>
    </form>
</div>
    
   

    <jsp:include page="assets/config/footer.jsp" />

    <!-- Scripts -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/custom.js"></script>
    <script>
    	function readURL(input) {
	    	  if (input.files && input.files[0]) {
	    	    var reader = new FileReader();
	    	    reader.onload = function (e) {
	    	      $('#blah')
	    	        .attr('src', e.target.result)
	    	        .attr('style',"display = 'block'");
	    	      document.getElementById('image-placeholder').style.display = 'none';
	    	    };
	    	    reader.readAsDataURL(input.files[0]);
	    	  }
	    }
		document.getElementById('blah').onerror = function() {
			this.style.display = 'none';
	        document.getElementById('image-placeholder').style.display = 'block'; // Show the placeholder
	    };
    </script>
</body>

</html>