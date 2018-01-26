<%--
  Created by IntelliJ IDEA.
  User: ozzy
  Date: 21.01.2018
  Time: 00:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
          integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
<%@include file="META-INF/jspf/header.jspf"%>

<div class="login-box">
    <img src="image/user.png" class="avatar">
    <h1>Login Here</h1>
    <form action="/login" method="get">
        <p>User Email</p>
        <input type="text" name="email" placeholder="Enter e-mail">
        <p>Password</p>
        <input type="password" name="password" placeholder="Enter password">
        <input type="submit" name="submit" value="Login">
        <a href="">Forgot your password?</a>

    </form>
</div>

</body>
</html>
