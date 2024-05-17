<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor login</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.point-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>


	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">

				<div class="card point-card">
					<div class="card-body">
						<p class="fs-4 text-center">Doctor Login</p>
						
							<c:if test="${not empty sucMsg}">
						<p class="text-center text-success fs-3">${sucMsg}</p>
						<c:remove var="sucMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty faiMsg }">
						<p class="text-center text-danger fs-3">${faiMsg}</p>
						<c:remove var="faiMsg" scope="session"/>
						</c:if>
						

						<form action="doctorLogin" method="post">
							<div mb-3>
								<label class="form-label">Email Address</label> <input required
									name="email" type="email" class="form-control">

							</div>
							<div mb-3>
								<label class="form-label">PassWord</label> <input required
									name="password" type="password" class="form-control">

							</div>
							<br>
							<button type="submit" class="btn bg-success text-white col-md-12"> Login</button>
							

						</form>
					</div>

				</div>

			</div>
		</div>
	</div>

</body>
</html>