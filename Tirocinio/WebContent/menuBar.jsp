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

<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Start Bootstrap</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
				<c:choose>
				<c:when test="${amministratoreController.amministratore == null }">
					<li><a href='<c:url value="/faces/loginAmministratore.jsp" />'>
							Amministrazione</a></li>
							</c:when>
							<c:otherwise>
							<li><a href='<c:url value="/faces/secured/amministratoreHome.jsp" />'>
							${amministratoreController.amministratore.pin}</a></li>
							</c:otherwise>
							</c:choose>
					<li><a href="#">Services</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Page Content -->

			<div class="col-md-3">
				<p class="lead">E-COMMERCE</p>
				<div class="list-group">
				<c:choose>
				<c:when test="${clienteController.cliente != null }">
					<a href='<c:url value="/faces/private/clienteHome.jsp" />' class="list-group-item active">${clienteController.cliente.nome} ${clienteController.cliente.cognome}</a>
					<a href='<c:url value="/faces/prodotti.jsp" />' class="list-group-item">Catalogo Prodotti</a>
					</c:when>
					<c:otherwise>
					<a href='<c:url value="/faces/prodotti.jsp" />' class="list-group-item active">Catalogo Prodotti</a>
					<a href='<c:url value="/faces/login.jsp" />' class="list-group-item">Login</a> 
					<a href='<c:url value="/faces/registrazione.jsp" />' class="list-group-item">Registrati</a> 
				</c:otherwise>
				</c:choose>
				</div>
			</div>

</body>
</html>