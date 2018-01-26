<%@ page import="static java.lang.Integer.parseInt" %>
<jsp:useBean id="lessonService" scope="application" type="service.LessonService"/>
<%--
  Created by IntelliJ IDEA.
  User: ozzy
  Date: 26.01.2018
  Time: 02:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Moderation Window</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
          integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/header.css">
</head>
<body>

<form action="/moderate" method="get"></form>
<form action="/update" method="post">
    <%
        int id = Integer.parseInt(request.getParameter("id"));
    %>

    <%@include file="META-INF/jspf/header.jspf" %>

    <div style="width: 100%;" align="center">
        <p>Name</p>
        <input type="text" name="name" value="${lessonService.allLessonsForModerate.get(id-1).name}">
        <p>Course id</p>
        <input type="text" name="courseId" value="${lessonService.allLessonsForModerate.get(id-1).courseId}">
        <p>Price</p>
        <input type="text" name="price" value="${lessonService.allLessonsForModerate.get(id-1).price}">
        <p>Image</p>
        <input style="width: 400px" type="text" name="image"
               value="${lessonService.allLessonsForModerate.get(id-1).image}">
        <p>About</p>
        <input style="width: 400px" type="text" name="about"
               value="${lessonService.allLessonsForModerate.get(id-1).about}">
        <p></p>
        <div class="btn-group" role="group" aria-label="Basic example">
            <button type="submit" class="btn btn-primary">Update</button>
            <%--<button type="submit" class="btn btn-primary">Create</button>--%>

            <a href="moderate.jsp" class="btn btn-primary" style="height: 38px; margin-left: 5px">Cancel</a>
        </div>
    </div>
    <%@include file="META-INF/jspf/footer.jspf" %>
</form>
</body>
</html>
