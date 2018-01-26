<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ozzy
  Date: 26.01.2018
  Time: 05:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
          integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/header.css">
</head>
<body>

<%@include file="META-INF/jspf/header.jspf" %>


<jsp:useBean id="lessonService" scope="application" class="service.LessonService"/>
<div>
    <div class="list-group">
        <c:forEach items="${lessonService.allLessonsForModerate}" var="elem">
        <a href="delete?id=${elem.id}" class="list-group-item list-group-item-action disabled">${elem.name}</a>
    </div>
    </c:forEach>
    <div class="btn-group" role="group" aria-label="Basic example" style="margin-left: 600px; margin-top: 20px">
        <a href="moderate.jsp" class="btn btn-primary" style="height: 38px; margin-left: 5px">Cancel</a>
    </div>
</div>

<%@include file="META-INF/jspf/footer.jspf" %>

</body>
</html>
