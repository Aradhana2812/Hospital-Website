 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@page isELIgnored="false" %>


<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="../index.jsp"><i
			class="fa-solid fa-house-chimney-medical"></i>MEDI HOME</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><i
						class="fa-solid fa-right-to-bracket"></i>Home</a></li>

<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="Patient.jsp?id=${doctObj.id }">Patient</a></li>

				




			</ul>

                       <c:if test="${not empty doctObj }">
					
					
				 <li class="nav-item dropdown"><a
					class="btn btn-secondary dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						${doctObj.fullName }</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						
						<li><a class="dropdown-item" href="../doctorLogout">LogOut</a></li>
						<li><hr class="dropdown-divider"></li>
						
					</ul></li>
					
					</c:if>
			
			

		</div>
	</div>
</nav>