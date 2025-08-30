<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add Recipe | CookCraft</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;700&display=swap" rel="stylesheet">

  <!-- Lottie -->
  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>

  <link rel="stylesheet" href="css/style1.css">
</head>
<body>

<%@ include file="includes/navbar.jsp" %>
  
 <%
    String msg = (String) session.getAttribute("msg");
    String msgType = (String) session.getAttribute("msgType");
    if (msg != null) {
%>
    <div id="autoDismissAlert" class="alert alert-<%= msgType %> alert-dismissible fade show" role="alert">
        <%= msg %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<%
        session.removeAttribute("msg");
        session.removeAttribute("msgType");
    }
%>

<div class="main-section">

  <!-- Left: Lottie + Text -->
<div class="left-pane text-center">
  <div class="lottie-wrapper d-flex justify-content-center">
    <lottie-player
      src="animations/cooking.json"
      background="transparent"
      speed="1"
      style="width: 100%; max-width: 350px;"
      loop autoplay>
    </lottie-player>
  </div>
  <div class="headline">Let’s Cook Something Special! 🍳</div>
  <div class="subline">Share your magical recipe with the foodies of the world 🌍</div>
</div>
  

  <!-- Right: Form -->
  <div class="right-pane">
    <h3 class="mb-4 text-center">Add a New Recipe</h3>
    <form action="AddRecipeServlet" method="post" enctype="multipart/form-data">

      <input type="text" name="recipeName" class="form-control" placeholder="Recipe Name" required>

      <textarea name="description" class="form-control" placeholder="Short Description" rows="2" required></textarea>

      <!-- INGREDIENTS SECTION -->
      <label><strong>Ingredients (Step by Step)</strong></label>
      <div id="ingredient-list">
        <div class="step-container">
          <input type="text" name="ingredients" class="form-control" placeholder="e.g. 2 eggs" required>
          <button type="button" onclick="addIngredient()">➕</button>
        </div>
      </div>

      <!-- STEPS SECTION -->
      <label class="mt-3"><strong>Preparation Steps</strong></label>
      <div id="step-list">
        <div class="step-container">
          <textarea name="steps" class="form-control" placeholder="e.g. Beat the eggs" rows="2" required></textarea>
          <button type="button" onclick="addStep()">➕</button>
        </div>
      </div>

      <input type="number" name="cookTime" class="form-control" placeholder="Cooking Time (in mins)" required>

      <select name="category" class="form-select" required>
        <option value="">Select Category</option>
        <option>Veg</option>
        <option>Non-Veg</option>
        <option>Desserts</option>
        <option>Snacks</option>
        <option>Soups</option>
        <option>Salads</option>
        <option>Main Course</option>
        <option>Beverages</option>
        
      </select>
       <select name="difficulty" class="form-select" required>
        <option value="">Difficulty Level</option>
        <option>Easy</option>
        <option>Medium</option>
        <option>Hard</option>
      </select>

      <input type="file" name="image" class="form-control" accept="image/*" required>
      
      <%
        if(session.getAttribute("auth")!=null){ %>
          <div class="text-end mt-3">
            <button type="submit" class="btn btn-orange">🚀 Publish</button>
          </div>
        <% } else{ %>
           <div class="text-end mt-3">
            <h6>Login to publish Recipe</h6>
          </div>
        <% } %>
      
    </form>
  </div>

</div>

<script>


	// Automatically hide alert after 3 seconds (3000ms)
	setTimeout(function () {
	  var alertEl = document.getElementById('autoDismissAlert');
	  if (alertEl) {
	    var alert = bootstrap.Alert.getOrCreateInstance(alertEl);
	    alert.close();
	  }
	}, 3000);
	
	
  function addIngredient() {
    const list = document.getElementById("ingredient-list");
    const item = document.createElement("div");
    item.className = "step-container";
    item.innerHTML = `
      <input type="text" name="ingredients" class="form-control" placeholder="e.g. 1 cup flour" required>
      <button type="button" onclick="this.parentElement.remove()">🗑️</button>
    `;
    list.appendChild(item);
  }

  function addStep() {
    const list = document.getElementById("step-list");
    const item = document.createElement("div");
    item.className = "step-container";
    item.innerHTML = `
      <textarea name="steps" class="form-control" rows="2" placeholder="Describe the step" required></textarea>
      <button type="button" onclick="this.parentElement.remove()">🗑️</button>
    `;
    list.appendChild(item);
  }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
