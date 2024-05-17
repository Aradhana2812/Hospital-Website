<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.db.DbConnect"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.*"%>
<%@page import="com.DAO.DoctorDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user appointment</title>
<%@ include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.backImg {
	background: Linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url=("img/hospital.jpg)";
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>


	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img alt="" src="img/doct7.png">
			</div>
			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						<c:if test="${not empty sucMsg}">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<c:if test="${not empty faiMsg }">
							<p class="text-center text-danger fs-3">${faiMsg}</p>
							<c:remove var="faiMsg" scope="session" />
						</c:if>

						<form class="row g-3" action="appointment" method="post">
							<input type="hidden" name=userid  value=${UserObj.id }>
							<div class="col-md-6">
								<label class="form-label">FullName</label><input type="text"
									required name="fullname" class="forn-control">
							</div>

							<div class="col-md-6">
								<label >Gender</label> <select name="gender"
									required class="form-control">
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label class="form-label">Age</label><input type="number"
									required name="age" class="forn-control">
							</div>
							<div class="col-md-6">
								<label class="form-label">Appointment Date</label><input
									type="date" required name="appointment" class="forn-control">
							</div>


							<div class="col-md-6">
								<label class="form-label">Email</label><input type="text"
									required name="email" class="forn-control">
							</div>
							<div class="col-md-6">
								<label class="form-label">Mob No</label><input type="text"
									required name="mobno" class="forn-control">
							</div>
							<div class="col-md-6">
								<label class="form-label">Diseases</label><input type="text"
									required name="dieseases" class="forn-control">
							</div>

							<div class="col-md-6">
								<label for="inputpassword4" >Doctor</label> <select name="doct"
									required class="form-control">
									<option >---select---</option>
									<%
									DoctorDAO dao = new DoctorDAO(DbConnect.getConn());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor s : list) {
									%>

									<option value="<%=s.getId() %>">
										<%=s.getFullName()%>(<%=s.getSpecialist() %>)</option>
									<%
									}
									%>
								

								</select>
							</div>

							<div class="col-md-12">
								<label >Address</label>
								<textArea required name="address"  class="forn-control" rows="3"cols="60"></textArea>
							</div>
							<c:if test="${empty UserObj }" >

								<a href="user_login.jsp" class="col-md-6 btn btn-success ">Submit</a>

								
							</c:if>
							<c:if test="${ not empty UserObj }" >

								<button type="submit" class="btn btn-primary">Submit</button>
							</c:if>


                  
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>