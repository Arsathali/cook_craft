<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.*" %>
<%

   User user = (User) session.getAttribute("auth");

   if(user!=null){
	   response.sendRedirect("home.jsp");
   }

%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login | CookCraft</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap & Google Fonts -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@600;700&display=swap" rel="stylesheet">

  <!-- Lottie Player -->
  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>

  <style>
    body {
      margin: 0;
      background: linear-gradient(to right, #ffecd2 0%, #fcb69f 100%);
      font-family: 'Quicksand', sans-serif;
    }

    .container-custom {
      display: flex;
      min-height: 100vh;
      align-items: center;
      justify-content: center;
      padding: 40px 20px;
    }

    .left-box, .right-box {
      flex: 1;
      padding: 40px;
    }

    .left-box {
      text-align: left;
      color: #222;
    }

    .left-box h1 {
      font-size: 42px;
      font-weight: bold;
    }

    .left-box p {
      margin-top: 15px;
      font-size: 18px;
      color: #444;
    }

    .right-box {
      background: #ffffff10;
      backdrop-filter: blur(10px);
      border-radius: 20px;
      box-shadow: 0 0 20px rgba(0,0,0,0.1);
      padding: 40px;
      max-width: 400px;
      
      margin-right:100px;
    }

    .right-box h2 {
      color: #ff5722;
      text-align: center;
      margin-bottom: 30px;
      font-weight: 700;
    }

    .form-control {
      border-radius: 12px;
      padding: 12px;
      margin-bottom: 20px;
    }

    .btn-orange {
      width: 100%;
      background: #ff5722;
      color: white;
      font-weight: bold;
      border-radius: 12px;
      padding: 12px;
      border: none;
    }

    .btn-orange:hover {
      background: #e64a19;
    }

    @media (max-width: 768px) {
      .container-custom {
        flex-direction: column;
      }

      .left-box, .right-box {
        flex: 1 1 100%;
      }
    }
  </style>
</head>
<body>

<div class="container-custom">

  <!-- Left Box -->
  <div class="left-box">
    <lottie-player
      src="https://assets10.lottiefiles.com/packages/lf20_kkflmtur.json"
      background="transparent"
      speed="1"
      style="width: 100%; max-width: 400px;"
      loop autoplay>
    </lottie-player>
    <h1>Welcome to CookCraft 🍲</h1>
    <p>Login to explore magical recipes, share your culinary secrets, and become a part of the food lover's world. Your next favorite dish starts here!</p>
  </div>

  <!-- Right Box -->
  <div class="right-box">
    <h2>Login</h2>
    <form action="LoginServlet" method="post">
      <input type="text" name="username" class="form-control" placeholder="Enter Username" required>
      <input type="password" name="password" class="form-control" placeholder="Enter Password" required>
      <button type="submit" class="btn-orange">Login</button>
    </form>
  </div>

</div>

</body>
</html>
