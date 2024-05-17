<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@page isELIgnored="false" %>
   

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DoctorDashboard</title>
<%@ include file="../component/allcss.jsp" %>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>

<c:if test="${empty doctObj }">
<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

<%@include file="navbar.jsp" %>


<div class="container p-2">
<p class="text-center fs-3">Doctor Dashboard</p>
                       <c:if test="${not empty sucMsg}">
						<p class="text-center text-success fs-3">${sucMsg}</p>
						<c:remove var="sucMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty faiMsg }">
						<p class="text-center text-danger fs-3">${faiMsg}</p>
						<c:remove var="faiMsg" scope="session"/>
						</c:if>
						
						<div class="row">
						<div class="col-md-4">
						<div class="card paint-card">
						<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center"> Doctor <br> 5 </p>
						</div>
						</div>
						</div>
						
						<div class="col-md-4">
						<div class="card paint-card">
						<div class="card-body text-center text-success">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center"> Appointment <br> 43 </p>
						</div>
						</div>
						</div>
						</div>
						</div>


</body>
</html>