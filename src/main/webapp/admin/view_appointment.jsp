<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.db.DbConnect"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.*"%>
<%@page import="com.DAO.AppointmentDAO"%>
<%@page import="com.DAO.DoctorDAO"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view appointment</title>
<%@ include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container-fluid p-3">
<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Appointment Details</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">PatientName</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appoint Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">DoctorName</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
									
								</tr>
							</thead>
							<tbody>
							
                                 <%AppointmentDAO dao2 = new AppointmentDAO(DbConnect.getConn());
                                List<Appointment> list2= dao2. getAllAppointment();
                                for(Appointment d:list2){%>
                                <tr>
                                <td> <%=d.getFullname()%></td> 
                                <td> <%=d.getGender() %></td> 
                                <td> <%=d.getAge() %></td> 
                                <td> <%=d.getAppoinDate() %></td> 
                                <td> <%=d.getDiseases() %></td>
                                <%DoctorDAO dao = new DoctorDAO(DbConnect.getConn());
                                Doctor doctor= dao. getDoctorById(d.getDoctorId());%> 
                                <td> <%= doctor.getFullName()%></td> 
                               <td> <%=d.getStatus() %></td>
                             <td> <a href="EditAppointment.jsp?id=<%=d.getId() %>" class="btn-btn-sm btn-primary text-decoration-none">Edit</a> <a href="../deleteAppointment?id=<%= d.getId() %>" class="btn-btn-sm btn-danger text-decoration-none">Delete</a></td> 
                                
                                
                               
                                
                                
                                </tr>
                                
                                
                                <%} %>


							</tbody>

                                     
						</table>
					</div>
				</div>

			</div>
			</div>
</body>
</html>