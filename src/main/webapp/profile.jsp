<%--
  Created by IntelliJ IDEA.
  User: ozzy
  Date: 25.01.2018
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
          integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/header.css">
</head>
<body>

<%
    String image = (String) session.getAttribute("image");
    if (image.contains("http://")) {
        image = image.substring(7);
    }
    if (image.contains("https://")) {
        image = image.substring(8);
    }
%>
<div class="container" style="margin-top: 40px">

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">Employee Data:</h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"><img alt="User Pic"
                                                                    src=http://<%=image%>
 class="img-circle img-responsive">
                </div>

                <!--<div class="col-xs-10 col-sm-10 hidden-md hidden-lg"> <br>
                  <dl>
                    <dt>DEPARTMENT:</dt>
                    <dd>Administrator</dd>
                    <dt>HIRE DATE</dt>
                    <dd>11/12/2013</dd>
                    <dt>DATE OF BIRTH</dt>
                       <dd>11/12/2013</dd>
                    <dt>GENDER</dt>
                    <dd>Male</dd>
                  </dl>
                </div>-->
                <div class=" col-md-9 col-lg-9 ">
                    <table class="table table-user-information">
                        <tbody>
                        <tr>
                            <td>Name:</td>
                            <td><%= session.getAttribute("name")%>
                            </td>
                        </tr>
                        <tr>
                            <td>Surname:</td>
                            <td><%= session.getAttribute("surname")%>
                            </td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><%= session.getAttribute("email")%>
                            </td>
                        </tr>
                        <tr>
                            <td>Mobile phone:</td>
                            <td><%= session.getAttribute("phone")%>
                            </td>
                        </tr>
                        <tr>
                            <td>Role:</td>
                            <td><%= session.getAttribute("role")%>
                            </td>
                        </tr>

                        </tbody>
                    </table>

                    <a href="index.jsp" class="btn btn-primary">Home Page</a>
                    <a href="/logout" class="btn btn-primary">Logout</a>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button"
               class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
            <span class="pull-right">
                            <a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button"
                               class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a href="index.jsp" data-toggle="tooltip" type="button"
                               class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
        </div>

    </div>
</div>
</body>
</html>
