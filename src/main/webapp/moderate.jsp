<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ozzy
  Date: 25.01.2018
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Moderate</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
          integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/header.css">
</head>
<body>

<%@include file="META-INF/jspf/header.jspf" %>

<jsp:useBean id="lessonService" scope="application" class="service.LessonService"/>
<div style="padding-bottom: 55rem">
    <c:forEach items="${lessonService.allLessonsForModerate}" var="elem">
        <div class="card" style="width: 18rem; float: left; height: 25rem">
            <img class="card-img-top" src="${elem.image}" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">${elem.name}</h5>
                <a href="moderate?id=${elem.id}" class="list-group-item list-group-item-action">MODERATE</a>
            </div>
        </div>
    </c:forEach>
<div style="position: fixed; bottom: 80px; margin-left: 500px">
    <a href="create_window.jsp" class="btn btn-primary" style="height: 38px;">Create Lesson</a>
    <a href="delete_window.jsp" class="btn btn-primary" style="height: 38px;">Delete Lesson</a>
</div>
</div>

<%@include file="META-INF/jspf/footer.jspf" %>
</body>
</html>
