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
<c:if test="${empty doctObj }">
<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

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
									
									<th scope="col">Status</th>
									
									<th scope="col">Action</th>
									
								</tr>
							</thead>
							<tbody>
							
                                 <%int doctid=Integer.parseInt(request.getParameter("id"));
                                
                                 AppointmentDAO dao2 = new AppointmentDAO(DbConnect.getConn());
                                 List<Appointment> list2= dao2. getAppointmentByDoctorId(doctid);
                                 for(Appointment d:list2){%>
                                <tr>
                                <td> <%=d.getFullname()%></td>
                                <td> <%=d.getGender() %></td> 
                                <td> <%=d.getAge()%></td> 
                                <td> <%=d.getAppoinDate() %></td> 
                                <td> <%=d.getDiseases() %></td>
                           
                                 <td> <%=d.getStatus() %></td>
                                
                                 <td> <a href="Status.jsp?id=<%=d.getId() %>" class="btn-btn-sm btn-primary text-decoration-none">Set Status</a> 
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