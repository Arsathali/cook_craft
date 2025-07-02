<%@ page import="com.model.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>CookCraft Navbar</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
    }
    .navbar-custom {
      background: linear-gradient(145deg, #2e2e2e, #1a1a1a);
      box-shadow: 0 20px 60px rgba(0, 0, 0, 0.85);
      border-radius: 0 0 25px 25px;
      padding: 1rem 2rem;
      transition: all 0.3s ease-in-out;
    }

    .navbar-brand {
      color: #ffffff !important;
      font-weight: 700;
      font-size: 1.7rem;
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .navbar-nav {
      gap: 2rem;
    }

    .nav-link {
      color: #ffffff !important;
      font-weight: 500;
      font-size: 1rem;
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 0.6rem 1rem;
      border-radius: 15px;
      transition: all 0.3s ease;
      box-shadow: inset 0 0 0 rgba(255,255,255,0);
      position: relative;
    }

    .nav-link i {
      font-size: 1.2rem;
      transition: all 0.3s ease;
    }

    /* Hover Effects */
    .nav-link:hover {
      background-color: #292929;
      transform: scale(1.1);
      box-shadow: 0 8px 20px rgba(253, 183, 3, 0.15), inset 0 0 8px rgba(255,183,3,0.2);
      color: #ffb703 !important;
    }

    .nav-link:hover i {
      color: #ffb703 !important;
      transform: scale(1.3);
      text-shadow: 0 0 8px #ffb703;
    }

    /* Brand Icon */
    .navbar-brand i {
      color: #ffffff;
      font-size: 1.5rem;
      transition: all 0.3s ease;
    }

    .navbar-brand:hover i {
      color: #00ffcc;
      text-shadow: 0 0 8px #00ffcc;
    }

    @media (max-width: 991px) {
      .navbar-nav {
        gap: 1rem;
        padding-top: 1rem;
      }
    }
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-custom">
  <div class="container-fluid">
    <!-- Left Logo and Title -->
    <a class="navbar-brand" href="#">
      <i class="fas fa-utensils"></i> CookCraft
    </a>

    <!-- Mobile toggle -->
    <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Right Menu -->
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav">
      
        <li class="nav-item">
          <a class="nav-link" href="home.jsp"><i class="fas fa-home"></i> Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="addRecipe.jsp"><i class="fas fa-plus"></i> Add Recipe</a>
        </li>
        
        <%
	      if(session.getAttribute("auth")!=null){ %>
	    	  <li class="nav-item">
	          <a class="nav-link" href="favourite.jsp"><i class="fas fa-heart"></i> Favourite</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="LogoutServlet"><i class="fas fa-unlock"></i> Log out</a>
	        </li>
	      <% } else{ %> 
	        <li class="nav-item">
	          <a class="nav-link" href="login.jsp"><i class="fas fa-unlock"></i> Log In</a>
	        </li>
	      <% } %>

      </ul>
    </div>
  </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
