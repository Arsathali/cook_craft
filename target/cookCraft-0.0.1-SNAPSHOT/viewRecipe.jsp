<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.model.*" %>
<%
    Recipe recipe = null;
    if (request.getAttribute("recipe") != null) {
        recipe = (Recipe) request.getAttribute("recipe");
    }else {
        response.sendRedirect("home.jsp");
        System.out.print("error in view page");
        return;
    }
    
    String categoryName = "";
    switch (recipe.getCategoryId()) {
        case 1: categoryName = "Veg"; break;
        case 2: categoryName = "Non-Veg"; break;
        case 3: categoryName = "Desserts"; break;
        case 4: categoryName = "Snacks"; break;
        case 5: categoryName = "Soup"; break;
        case 6: categoryName = "Salads"; break;
        case 7: categoryName = "Main Course"; break;
        case 8: categoryName = "Beverages"; break;
        default: categoryName = "Unknown";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Recipe View | CookCraft</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;700&display=swap" rel="stylesheet">

    <!-- Lottie Animation Script -->
    <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>

    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Quicksand', sans-serif;
            background: linear-gradient(to right, #42275a, #734b6d);
            color: white;
        }
        .section-title {
            font-size: 2rem;
            margin-bottom: 20px;
            text-align: center;
        }
        .recipe_img {
            height: 300px;
            width: 300px;
            object-fit: cover;
            border-radius: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        }
        .ingredients span {
            display: inline-block;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 10px 15px;
            border-radius: 20px;
            margin: 8px;
            animation: fall 3.5s ease-in-out infinite;
        }
        @keyframes fall {
            0% { transform: translateY(-10px); opacity: 0; }
            50% { transform: translateY(10px); opacity: 1; }
            100% { transform: translateY(0); opacity: 0.8; }
        }
        .steps {
            position: relative;
            padding-left: 60px;
            counter-reset: step;
        }
        .step {
            position: relative;
            margin-bottom: 40px;
            padding-left: 30px;
        }
        .step::before {
            counter-increment: step;
            content: counter(step);
            position: absolute;
            left: -50px;
            top: 0;
            background: #ff7f50;
            color: white;
            border-radius: 50%;
            width: 35px;
            height: 35px;
            text-align: center;
            line-height: 35px;
            font-weight: bold;
            box-shadow: 0 0 10px #ff7f50aa;
        }
        .steps::before {
            content: "";
            position: absolute;
            left: -32px;
            top: 15px;
            width: 2px;
            height: 100%;
            background: linear-gradient(to bottom, #ff7f50, transparent);
        }
        .fav-btn {
            background: #ff7f50;
            color: white;
            border: none;
            border-radius: 30px;
            padding: 10px 20px;
            transition: transform 0.2s ease, background 0.3s;
        }
        .fav-btn:hover {
            transform: scale(1.1);
            background: #e5673d;
        }
    </style>
</head>
<body>


 <%
    String msg = request.getParameter("message");

    if (msg != null) {
%>
    <div id="autoDismissAlert" class="alert alert-success alert-dismissible fade show" role="alert">
        <%= msg %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<%
        session.removeAttribute("message");
    }
%>


<div class="container py-5">
    <div class="row align-items-center">
        <div class="col-md-6 text-center">
            <img class="recipe_img" src="<%= request.getContextPath() + "/" + recipe.getImagePath() %>" alt="Recipe Image">
        </div>
        <div class="col-md-6">
            <h1 class="mb-3"><%= recipe.getName() %></h1>
            <form action="AddToFavServlet?recipeId=<%= recipe.getRecipeId()%>" method="post">
                <input type="hidden" name="recipeId">
                <button type="submit" class="fav-btn mb-3">❤️ Add to Favorites</button>
            </form>
            <p><strong>Duration:</strong> <%= recipe.getTime() %> min &nbsp; | &nbsp; <strong>Difficulty:</strong> Medium</p>
            <p><strong>Category:</strong> <%= categoryName %></p>
            <p><strong>Description:</strong> <%= recipe.getDescription() %></p>
        </div>
    </div>

    <div class="section-title mt-5">Ingredients</div>
    <div class="ingredients text-center">
        <%
            String[] ingredients = recipe.getIngredients().split(",");
            for (int i = 0; i < ingredients.length; i++) {
        %>
            <span><%= ingredients[i].trim() %></span>
        <%
            }
        %>
    </div>

    <div class="section-title mt-5">Preparation Steps</div>
    <div class="row align-items-center">
        <div class="col-md-6">
            <div class="steps">
                <%
                    String[] steps = recipe.getInstructions().split("\\.");
                    for (int i = 0; i < steps.length; i++) {
                %>
                    <div class="step">
                        <p><%= steps[i].trim() %></p>
                    </div>
                <%
                    }
                %>
            </div>
        </div>
        <div class="col-md-6 text-center">
            <lottie-player src="animations/cooking1.json"
                           background="transparent" speed="1"
                           style="width: 300px; height: 300px;" loop autoplay>
            </lottie-player>
        </div>
    </div>
</div>

<script>


//Automatically hide alert after 3 seconds (3000ms)
setTimeout(function () {
  var alertEl = document.getElementById('autoDismissAlert');
  if (alertEl) {
    var alert = bootstrap.Alert.getOrCreateInstance(alertEl);
    alert.close();
  }
}, 3000);

</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
