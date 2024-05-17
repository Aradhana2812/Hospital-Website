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
<title>doctor page</title>
<%@ include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
						<c:if test="${not empty sucMsg}">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<c:if test="${not empty faiMsg }">
							<p class="text-center text-danger fs-3">${faiMsg}</p>
							<c:remove var="faiMsg" scope="session" />
						</c:if>
						<form action="../addDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">FullName</label><input type="text"
									required name="fullname" class="forn-control">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label><input type="Date" required
									name="dob" class="forn-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label><input
									type="text" required name="qualification" class="forn-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control">
									<option>---select---</option>

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
									required name="email" class="forn-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No</label><input type="text"
									required name="mobno" class="forn-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label><input type="text"
									required name="password" class="forn-control">
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>


					</div>
				</div>
			</div>

			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">FullName</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">MobNo</th>
									<th scope="col">ACTION</th>
									
								</tr>
							</thead>
							<tbody>
                                 <%	DoctorDAO dao2 = new DoctorDAO(DbConnect.getConn());
                                List<Doctor> list2= dao2.getAllDoctor();
                                for(Doctor d:list2){%>
                                <tr>
                                <td> <%=d.getFullName()%></td> 
                                <td> <%=d.getDob() %></td> 
                                <td> <%=d.getQualification() %></td> 
                                <td> <%=d.getSpecialist() %></td> 
                                <td> <%=d.getEmail() %></td> 
                                <td> <%=d.getMobNo() %></td> 
                                <td> <a href="DoctorEdit.jsp?Id=<%=d.getId()%>" class="btn-btn-sm btn-primary text-decoration-none">Edit</a> <a href="../deleteDoctor?Id=<%=d.getId()%>" class="btn-btn-sm btn-danger text-decoration-none">Delete</a></td> 
                                
                                
                                
                                </tr>
                                
                                
                                <%} %>


							</tbody>

                                     
						</table>
					</div>
				</div>

			</div>



		</div>
	</div>
</body>
</html>