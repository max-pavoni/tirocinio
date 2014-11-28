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
				<div class="thumbnail">

							<div class="header">
				<h3>DETTAGLI FORNITORE</h3>
			</div>
			<div align="left">
				<p>Nome: ${fornitoreController.fornitore.nome}</p>
				<p>IVA: ${fornitoreController.fornitore.iva}</p>
				<p>Indirizzo: ${fornitoreController.fornitore.indirizzo}</p>
				<p>Mail: ${fornitoreController.fornitore.mail}</p>
				<p>Telefono: ${fornitoreController.fornitore.telefono}</p>
				</br>
				<c:if test="${amministratoreController.amministratore != null }">
					<h:commandLink action="#{fornitoreController.eliminaFornitore()}"
						value="Elimina Fornitore">
					</h:commandLink>
				</c:if>
			</div>
			<c:if test="${amministratoreController.amministratore != null }">
				<a href='<c:url value="/faces/secured/amministratoreHome.jsp" />'  >
					Vai al tuo Pannello di Controllo</a>
			</c:if>
			<c:if test="${clienteController.cliente != null }">
				<a href='<c:url value="/faces/private/clienteHome.jsp" />'> Vai
					alla tua Home</a>
			</c:if>
					</div>
					</div>
				</div>
			</div>
			<!-- jQuery -->
			<script src="js/jquery.js"></script>

			<!-- Bootstrap Core JavaScript -->
			<script src="js/bootstrap.min.js"></script>
		</h:form>

	</f:view>
</body>
</html>