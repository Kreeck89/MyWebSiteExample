<%--
  Created by IntelliJ IDEA.
  User: ozzy
  Date: 20.01.2018
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
          integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/header.css">
    <%--${lessonService.init()}--%>
</head>
<body>

<form action="/course" method="get">

    <%@include file="META-INF/jspf/header.jspf" %>

    <div class="left-block">
    <%@include file="META-INF/jspf/categories.jspf" %>
    </div>
    <div class="right-block">
    <%@include file="META-INF/jspf/lessons.jspf" %>
    </div>

    <%@include file="META-INF/jspf/footer.jspf"%>
</form>

</body>
</html>
