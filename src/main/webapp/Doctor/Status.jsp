<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.DAO.SpecialistDAO"%>
<%@page import="com.db.DbConnect"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.*"%>
<%@page import="com.DAO.AppointmentDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Status</title>
<%@ include file="../component/allcss.jsp"%>
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
<%@include file="navbar.jsp"%>

<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center"></p>
						<c:if test="${not empty sucMsg}">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<c:if test="${not empty faiMsg }">
							<p class="text-center text-danger fs-3">${faiMsg}</p>
							<c:remove var="faiMsg" scope="session" />
						</c:if>
						
						
						<% 
						int id=Integer.parseInt(request.getParameter("id"));
						AppointmentDAO dao2=new AppointmentDAO(DbConnect.getConn());
						Appointment d=dao2.getAppointmentId(id);
						%>
						<form action="../appointmentStatus" method="post">
							<div class="mb-3">
								<label class="form-label">FullName</label><input type="text"
									required name="fullname" class="forn-control" value="<%=d.getFullname() %>">
							</div>

							<div class="mb-3">
								<label class="form-label">Age</label><input type="text" required
									name="dob" class="forn-control" value="<%=d.getAge() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">Diseases</label><input
									type="text" required name="diseases" class="forn-control" value="<%=d.getDiseases() %>">
							</div>
							<label class="form-label">Set Status</label><input
									type="text" required name="status" class="forn-control" value="">
							</div>

							
							<input type="hidden" name="id" value=<%=d.getId()%>>
							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>


					</div>
				</div>
			</div>
			

</body>
</html>