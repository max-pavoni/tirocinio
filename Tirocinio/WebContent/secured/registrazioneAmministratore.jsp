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
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/shop-homepage.css" rel="stylesheet">

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
					<c:import url="../menuBar.jsp" />

					<div class="col-md-5">
	<h2>inserisci i dati del nuovo Amministratore:</h2>

			<div>
				Nome:
				<h:inputText value="#{amministratoreController.nome}"
					required="true" requiredMessage="Questo campo e' obbligatorio!"
					id="name" />
				<h:message for="name" />
			</div>
			<div>
				Cognome:
				<h:inputText value="#{amministratoreController.cognome}"
					required="true" requiredMessage="Questo campo e' obbligatorio!"
					id="cognome" />
				<h:message for="cognome" />
			</div>

			<div>
				Pin:
				<h:inputText value="#{amministratoreController.pin}" required="true"
					requiredMessage="Questo campo e' obbligatorio!" id="pin" />
				<h:message for="pin" />
			</div>
			<div>
				Password:
				<h:inputSecret value="#{amministratoreController.password}"
					required="true" requiredMessage="Questo campo e' obbligatorio!"
					validatorMessage="La password deve contenere almeno 8 caratteri."
					id="password">
					<f:validateLength minimum="8" />
				</h:inputSecret>
				<h:message for="password" />
			</div>
			<div>
				<h:commandButton value="Registra"
					action="#{amministratoreController.registraAmministratore}" />

			</div>
			<li><a
				href='<c:url value="/faces/secured/amministratoreHome.jsp" />'>Torna
					al Pannello di Controllo</a></li>
		</div>
				</div>
			</div>
			<!-- jQuery -->
			<script src="../js/jquery.js"></script>

			<!-- Bootstrap Core JavaScript -->
			<script src="../js/bootstrap.min.js"></script>
		</h:form>

	</f:view>
</body>
</html>