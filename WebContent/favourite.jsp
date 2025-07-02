<%@ page import="com.connection.DbConnection" %>
<%@ page import="com.Dao.recipeDao" %>
<%@ page import="com.model.Recipe" %>
<%@ page import="java.util.*" %>
<%

   
   if(session.getAttribute("auth")==null){
	   response.sendRedirect("login.jsp");
	   return;
   }

   User user = (User) session.getAttribute("auth");
   int userId = user.getUserId();

   
   // my recipes
   recipeDao rd = new recipeDao(DbConnection.getConnection());
   List<Recipe> myList = rd.getMyList(userId);
   
   //fav list
   List<Recipe> favList = rd.getFavoriteRecipesByUserId(userId);
%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Favourite Recipes | CookCraft</title>

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome for heart icon -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@600&display=swap" rel="stylesheet">

  <style>
  
    body {
      background-color: #fffaf3;
      font-family: 'Quicksand', sans-serif;
    }

    .recipe-card {
      background-color: #ffffff;
      border-radius: 20px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.05);
      overflow: hidden;
      transition: all 0.3s ease-in-out;
      margin-top:30px;
      margin-bottom: 30px;
      padding: 20px;
      border-left: 8px solid #ffa500;
    }

    .recipe-card:hover {
      transform: scale(1.02);
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
    }

    .recipe-title {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 5px;
    }

    .recipe-description {
      font-size: 15px;
      color: #555;
      margin-bottom: 10px;
    }

    .time-label {
      background-color: #ffe2b4;
      color: #a05b00;
      padding: 5px 12px;
      font-size: 14px;
      border-radius: 20px;
      font-weight: 600;
      display: inline-block;
    }

    .recipe-img {
      width: 100%;
      height: auto;
      border-radius: 15px;
      object-fit: cover;
      max-width: 100px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    
    .btn-view-recipe {
    background-color: #fff;
    color: #a05b00;
    border: 2px solid #ffc107;
    padding: 6px 14px;
    font-size: 14px;
    border-radius: 20px;
    font-weight: 600;
    transition: all 0.3s ease-in-out;
  }

  .btn-view-recipe:hover {
    background-color: #ffe2b4;
    color: #a05b00;
    border-color: #ffb300;
  }

    .heart-icon {
      color: #ff4f81;
      font-size: 22px;
      margin-left: 10px;
      animation: pulse 1s infinite alternate;
    }

    @keyframes pulse {
      0% { transform: scale(1); }
      100% { transform: scale(1.1); }
    }

    @media (max-width: 768px) {
      .recipe-img {
        max-width: 80%;
        margin-top: 15px;
      }
         .carousel-caption h5 {
        font-size: 20px;
      }

      .carousel-caption p {
        font-size: 14px;
      }
    }
    
     .carousel-item {
      position: relative;
      height: 400px;
      background-color: #f8f9fa;
      border-radius: 15px;
      overflow: hidden;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
    }

    .carousel-item img {
      height: 100%;
      width: 100%;
      object-fit: cover;
      filter: brightness(60%);
    }

    .carousel-caption {
      bottom: 20px;
      left: 30px;
      right: 30px;
      background: rgba(0, 0, 0, 0.6);
      padding: 20px;
      border-radius: 15px;
      text-align: left;
    }

    .carousel-caption h5 {
      font-size: 28px;
      color: #fff;
    }

    .carousel-caption p {
      font-size: 16px;
      color: #f3f3f3;
    }

    .time-tag {
      background-color: #ffc107;
      color: #333;
      padding: 5px 12px;
      border-radius: 20px;
      font-size: 14px;
      font-weight: 600;
      display: inline-block;
    }

    .carousel-control-prev-icon,
    .carousel-control-next-icon {
      background-color: #00000080;
      padding: 20px;
      border-radius: 50%;
    }
    
  </style>
</head>
<body>

<%@ include file="includes/navbar.jsp" %>

<div class="container py-5">
  <h2 class="text-center mb-4"> My Recipes</h2>

  <div id="recipeCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">

     
    <%
	  for (int i = 0; i < myList.size(); i++) {
	    boolean isActive = (i == 0); // only first item should be active
	%>
	  <div class="carousel-item <%= isActive ? "active" : "" %>">
	    <img src="<%= request.getContextPath() + "/" + myList.get(i).getImagePath() %>" class="d-block w-100" alt="MyFoods">
	    <div class="carousel-caption">
	      <h5><%= myList.get(i).getName() %></h5>
	      <p><%= myList.get(i).getDescription() %></p>
	      <span class="time-tag"><i class="fas fa-clock me-1"></i> <%= myList.get(i).getTime() %> mins</span>
	      <a href="ViewSingleRecipeservlet?recipeId=<%= myList.get(i).getRecipeId() %>" class="btn btn-sm btn-outline-warning rounded-pill fw-semibold">
		    View Recipe
		  </a>
	    </div>
	  </div>
	<% } %>

    </div>

    <!-- Carousel Controls -->
    <button class="carousel-control-prev" type="button" data-bs-target="#recipeCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#recipeCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon"></span>
    </button>
  </div>
</div>


<div class="container mt-5">
  <h2 class="mb-4 text-center px-3"><i class="fas fa-heart heart-icon"></i> Your Favourite Recipes</h2>

  
 <%
 
     for(int j =0; j<favList.size(); j++){ %>
   
    	 <div class="row recipe-card align-items-center">
    	    <div class="col-md-8">
    	      <h4 class="recipe-title"><%= favList.get(j).getName() %> <i class="fas fa-heart heart-icon"></i></h4>
    	      <p class="recipe-description"><%= favList.get(j).getDescription() %>!</p>
    	      <span class="time-label"><i class="fas fa-clock me-1"></i><%= favList.get(j).getTime() %>mins</span>
    	      <a href="ViewSingleRecipeservlet?recipeId=<%= favList.get(j).getRecipeId() %>" class="btn-view-recipe text-decoration-none">
    			    View Recipe
    		  </a>
    	    </div>
    	    <div class="col-md-4 text-md-end text-center">
    	      <img src="<%= request.getContextPath() + "/" + favList.get(j).getImagePath() %>" class="recipe-img" alt="Lava Cake">
    	    </div>
    	  </div>

     <% } %>
  
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
