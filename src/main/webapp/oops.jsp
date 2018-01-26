<%--
  Created by IntelliJ IDEA.
  User: ozzy
  Date: 23.01.2018
  Time: 02:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Oops</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
          integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/header.css">
</head>
<body class="oops">

<%@include file="META-INF/jspf/header.jspf"%>

<div class="container" align="center">
    <div class="row">
        <div class="col-md-12">
            <div class="error-template">
                <h1>
                    OOPS!</h1>
                <h2>
                    404 Not Found</h2>
                <div class="error-details">
                    Sorry, but your E-mail or Password is wrong! Or you don`t registered.
                </div>
                <div class="error-actions">
                    <a href="login.jsp" class="btn btn-primary btn-lg"><span
                            class="glyphicon glyphicon-home"></span>
                        Take Me To Login </a><a href="http://www.jquery2dotnet.com" class="btn btn-default btn-lg"></a>
                </div>
            </div>
        </div>
    </div>
</div>



</body>
</html>
