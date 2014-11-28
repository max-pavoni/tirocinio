<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Shop Item - Start Bootstrap Template</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-homepage.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<f:view>
<h:form>
	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<c:import url="menuBar.jsp" />

			<div class="col-md-5">
									<c:choose>
				<c:when test="${clienteController.cliente == null}">
<h3>Inserisci le tue credenziali:</h3>
				<div class="thumbnail">
<p>
				E-mail:
				<h:inputText value="#{clienteController.email}" required="true"
					requiredMessage="Questo campo e' obbligatorio!" id="mail" />
				<h:message for="mail" />
			</p>
			<p>
				Password:
				<h:inputSecret value="#{clienteController.password}"
					required="true" requiredMessage="Questo campo e' obbligatorio!"
					id="password">
				</h:inputSecret>
				<h:message for="password" />
			</p>
				<p>

				<h:commandButton value="LOGIN"
					action="#{clienteController.login}" styleClass="btn-primary"></h:commandButton>

			</p>
			
				</div>
							</c:when>
				<c:otherwise>
				<p><h2> Sei gia' loggato!</h2></p>
				</c:otherwise>
				</c:choose>



			</div>

		</div>

	</div>
	<!-- /.container -->

	<div class="container">

		<hr>

		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; Your Website 2014</p>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
</h:form>
</f:view>
</body>

</html>
