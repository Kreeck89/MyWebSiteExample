<%--
  Created by IntelliJ IDEA.
  User: ozzy
  Date: 26.01.2018
  Time: 05:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
          integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
<form action="/create" method="post">
    <%@include file="META-INF/jspf/header.jspf" %>

    <div style="width: 100%;" align="center">
        <p>Name</p>
        <input type="text" name="name" placeholder="Enter course name">
        <p>Course id</p>
        <input type="text" name="courseId" placeholder="For what course id it`s lesson">
        <p>Price</p>
        <input type="text" name="price" placeholder="Price">
        <p>Image</p>
        <input style="width: 400px" type="text" name="image" placeholder="Link on Lesson title image">
        <p>About</p>
        <input style="width: 400px" type="text" name="about" placeholder="Some about this course">
        <p></p>
        <div class="btn-group" role="group" aria-label="Basic example">
            <button type="submit" class="btn btn-primary">Create</button>
            <a href="moderate.jsp" class="btn btn-primary" style="height: 38px; margin-left: 5px">Cancel</a>
        </div>
    </div>
    <%@include file="META-INF/jspf/footer.jspf" %>
</form>
</body>
</html>
