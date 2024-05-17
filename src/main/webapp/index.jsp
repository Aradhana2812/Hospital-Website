<%@page import="com.db.DbConnect" %>
<%@page import="java.sql.Connection" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index page</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.carousel-item: after {
	content: "";
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.1);
}

.carousel-caption {
	top: 70%;
}

.point-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>

	<%@include file="component/navbar.jsp"%>
	


	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/hos8jpg.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/doct5.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/hos2jpg.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>


	<div class="container p-3">
		<p class="text-center fs-2 ">Key Feature Of Hospital</p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>lorem ifns dolor amwnt msjdd shov uhdgsv iugsg ljd</p>
							</div>
						</div>
					</div>


					<div class="col-md-6">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>lorem ifns dolor amwnt msjdd shovljd jesua ghamvo</p>
							</div>
						</div>
					</div>


					<div class="col-md-6 mt-2">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">Freindly Doctor</p>
								<p>lorem ifns dolor amwnt ujhfcb louhhjw msjdd shovljd</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mt-2">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>
								<p>lorem ifns dolor amwnt msjdd iuyvhjkog yshbdbn shovljd</p>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="col-md-4">
				<img alt="" src="img/doct7.png" width="450px" height="360px">
			</div>
		</div>

	</div>
	<hr>
	<div class="container p-2">
		<p class="text-center fs-2 ">Our Team</p>
		<div class="row">
			<div class="col -md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img alt="" src="img/doct3.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Saumani Simi</p>
						<p class="fs-7">(CEO & Chairman)</p>
					</div>

				</div>
			</div>

			<div class="col -md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img alt="" src="img/doct9.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Shiva Kumar</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>

				</div>
			</div>

			<div class="col -md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img alt="" src="img/doct4.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Arpit joshi</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>

				</div>
			</div>

			<div class="col -md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img alt="" src="img/doct1.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Aashma Paniv</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>

				</div>
			</div>
		</div>

	</div>

<%@include file="component/footer.jsp"%>
</body>
</html>