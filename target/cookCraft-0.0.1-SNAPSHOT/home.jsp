<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.DbConnection" %>
<%@ page import="com.Dao.recipeDao" %>
<%@ page import="com.model.Recipe" %>
<%@ page import="java.util.*" %>

<%
    recipeDao rd = new recipeDao(DbConnection.getConnection());
    

    String cat[] = {"Veg", "Non-Veg", "Desserts", "Snacks", "Soups", "Salads", "Main Course", "Beverages"};
    String images[] = {
        "fas fa-leaf fa-2x text-success",
        "fas fa-drumstick-bite fa-2x text-danger",
        "fas fa-ice-cream fa-2x text-secondary",
        "fas fa-cookie-bite fa-2x text-primary",
        "fas fa-mug-hot fa-2x text-info",
        "fas fa-seedling fa-2x text-success",
        "fas fa-utensils fa-2x text-primary",
        "fas fa-coffee fa-2x text-secondary"
    };

    Integer selectedIndex = (Integer) request.getAttribute("selectedCategoryIndex");
    if (selectedIndex == null) {
        selectedIndex = 0; 
    }
    List<Recipe> recipeList = rd.getRecipes(selectedIndex);
%>

<!DOCTYPE html>
<html>
<head>
     
    <meta charset="ISO-8859-1">
    <title>Recipe Categories</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">

    <%@ include file="includes/header.jsp" %>
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <!-- Search Bar -->
    <div class="container d-flex justify-content-center align-items-center py-5">
        <div class="search-wrapper text-center">
            <div class="search-bar position-relative">
                <input type="text" placeholder="Search recipes..." class="form-control search-input" />
                <div class="search-icon position-absolute top-50 end-0 translate-middle-y me-3">
                    <i class="fas fa-search text-white"></i>
                </div>
            </div>
        </div>
    </div>

    <!-- Category Section -->
    <section class="container mb-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4 class="fw-bold">Top Categories</h4>
            <a href="#" class="text-decoration-none text-primary">See all</a>
        </div>

        <div class="row g-3">
            <% for (int i = 0; i < cat.length; i++) {
                boolean isSelected = (selectedIndex != null && selectedIndex == i);
            %>
            <div class="col-6 col-md-3">
                <a href="FilterServlet?category=<%=i%>" class="text-decoration-none">
                    <div class="category-card text-center p-3 rounded shadow 
                        <%= isSelected ? "bg-warning text-white" : "bg-light" %>">
                        <i class="<%=images[i]%> mb-2" style="font-size: 1.4rem;"></i>
                        <h6 class="fw-semibold mb-0 <%= isSelected ? "text-white" : "text-primary" %>" style="font-size: 0.95rem;">
                            <%=cat[i]%>
                        </h6>
                    </div>
                </a>
            </div>
            <% } %>
        </div>
    </section>

    <!-- Title -->
    <div class="text-center mb-5">
        <h2 class="fw-bold">Discover Delicious Recipes</h2>
        <p class="text-muted fs-5">Handpicked dishes just for your cravings</p>
    </div>

    <!-- Recipe Cards -->
    <div class="container my-5">
        <div class="row g-4">
            <% for (int i = 0; i < recipeList.size(); i++) { %>
                <div class="col-md-4 mb-4">
                    <div class="recipe-card shadow-lg rounded-4 overflow-hidden position-relative">
                        <div class="recipe-img-wrapper">
                         <img src="<%= request.getContextPath() + "/" + recipeList.get(i).getImagePath() %>" 
                             class="w-100 h-100 object-fit-cover" alt="Recipe">
                        </div>
                        <div class="recipe-details p-4">
                            <h5 class="fw-bold mb-2"><%= recipeList.get(i).getName() %></h5>
                            <p class="text-muted mb-2"><%= recipeList.get(i).getDescription() %></p>
                            <div class="d-flex justify-content-between text-muted small mb-2">
                                <span><i class="fas fa-clock me-1"></i> <%= recipeList.get(i).getTime() %></span>
                                <span><i class="fas fa-signal me-1"></i> <%= recipeList.get(i).getDifficulty() %></span>
                            </div>
                            <a href="ViewSingleRecipeservlet?recipeId=<%= recipeList.get(i).getRecipeId() %>" class="btn btn-glow w-100">View Recipe</a>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>

    <script type="text/javascript" src="js/index.js"></script>
</body>
</html>
