<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
	Typify by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<script  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
 		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	</head>
    <body>
     <c:if test="${empty user}">
    <script> document.location = "index.jsp";</script>
      </c:if>
       <nav class="navbar navbar-expand-sm bg-dark fixed-top">
        <a class="navbar-brand" href="<c:choose>
  <c:when test="${not empty user}">home.jsp</c:when>
  <c:otherwise>index.jsp</c:otherwise>
</c:choose>"><i class="fa d-inline fa-lg fa-home"></i></a>  
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="studentSearch.jsp">Search Student</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="clubSearch.jsp">Search Club</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="relationship.jsp">Find Relationship</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="history.jsp">Search History</a>
    </li>
    <li class="nav-item">
     <c:choose>
  <c:when test="${not empty user}">
    <a class="btn navbar-btn ml-2 btn-secondary" href="LogoutController"><i class="fa d-inline fa-lg fa-user-circle-o"></i> Sign out</a>
  </c:when>
  <c:otherwise>
    <a class="btn navbar-btn ml-2  btn-secondary" href="index.jsp"><i class="fa d-inline fa-lg fa-user-circle-o"></i> Sign in</a>
  </c:otherwise>
</c:choose>
    </li>
  </ul>
  
</nav> 
        <input type="hidden" id="userid" value=${user.id} />
    </body>
</html>