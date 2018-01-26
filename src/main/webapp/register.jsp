<%--
  Created by IntelliJ IDEA.
  User: ozzy
  Date: 22.01.2018
  Time: 01:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
          integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/header.css">
</head>
<body>

<%@include file="META-INF/jspf/header.jspf"%>

<div align="center" style="margin-top: 30px">
    <form action="${pageContext.request.contextPath}/register" method="post" style="width: 500px">
        <div class="form-row">
            <div class="col-md-4 mb-3">
                <label for="validationServer01">First name</label>
                <input type="text" name="name" class="form-control" id="validationServer01"
                       placeholder="Name">
            </div>
            <div class="col-md-4 mb-3">
                <label for="validationServer02">Last name</label>
                <input type="text" name="surname" class="form-control" id="validationServer02"
                       placeholder="Surname">
            </div>
            <div class="col-md-4 mb-3">
                <label for="validationServerUsername">E-mail</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroupPrepend3">@</span>
                    </div>
                    <input type="text" name="email" class="form-control" id="validationServerUsername"
                           placeholder="Email">
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-6 mb-3">
                <label for="validationServer03">Enter your password</label>
                <input type="password" name="password" class="form-control" id="validationServer03"
                       placeholder="Password">
            </div>
            <div class="col-md-3 mb-3">
                <label for="validationServer04">Phone number</label>
                <input type="text" name="phone" class="form-control" id="validationServer04"
                       placeholder="Phone">
            </div>
            <div class="col-md-3 mb-3">
                <label for="validationServer05">Ava-Link</label>
                <input type="text" name="ava" class="form-control" id="validationServer05"
                       placeholder="link">
            </div>
        </div>
        <div class="form-group">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="invalidCheck3" required>
                <label class="form-check-label" for="invalidCheck3">
                    Agree to terms and conditions
                </label>
                <div class="invalid-feedback">
                    You must agree before submitting.
                </div>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

</body>
</html>
