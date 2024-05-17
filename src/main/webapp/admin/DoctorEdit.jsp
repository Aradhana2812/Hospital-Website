<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.DAO.SpecialistDAO"%>
<%@page import="com.db.DbConnect"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.*"%>
<%@page import="com.DAO.DoctorDAO"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>doctorEdit page</title>
<%@ include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	
		
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Doctor</p>
						<c:if test="${not empty sucMsg}">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<c:if test="${not empty faiMsg }">
							<p class="text-center text-danger fs-3">${faiMsg}</p>
							<c:remove var="faiMsg" scope="session" />
						</c:if>
						
						
						<% 
						int id=Integer.parseInt(request.getParameter("Id"));
						DoctorDAO dao2=new DoctorDAO(DbConnect.getConn());
						Doctor d=dao2.getDoctorById(id);
						%>
						<form action="../editDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">FullName</label><input type="text"
									required name="fullname" class="forn-control" value="<%=d.getFullName() %>">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label><input type="Date" required
									name="dob" class="forn-control" value="<%=d.getDob() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label><input
									type="text" required name="qualification" class="forn-control" value="<%=d.getQualification() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control" >
									<option><%=d.getSpecialist()%></option>

									<%
									SpecialistDAO dao = new SpecialistDAO(DbConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>

									<option>
										<%=s.getSpecialistName()%></option>
									<%
									}
									%>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label><input type="text"
									required name="email" class="forn-control" value="<%=d.getEmail() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No</label><input type="text"
									required name="mobno" class="forn-control" value="<%=d.getMobNo() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label><input type="text"
									required name="password" class="forn-control" value=<%=d.getPassword()%>">
							</div>
							<input type="hidden" name="Id" value=<%=d.getId()%>>
							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>


					</div>
				</div>
			</div>
			
			</body>
</html>