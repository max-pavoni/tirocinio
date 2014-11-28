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
			<div class="header">
				<h3>Nuovo Fornitore:</h3>
				<p>inserisci i dati</p>
			</div>
			<div class="sep"></div>
			<div class="inputs">
				<div align="left">
					<p>
						Nome:
						<h:inputText value="#{fornitoreController.nome}" required="true"
							requiredMessage="Questo campo è obbligatorio!" id="nome" />
						<h:message for="nome" />
					</p>

					<p>
						IVA:
						<h:inputText value="#{fornitoreController.iva}" required="true"
							requiredMessage="Questo campo è obbligatorio!" id="iva" />
						<h:message for="iva" />
					</p>
					<p>
						Indirizzo:
						<h:inputText value="#{fornitoreController.indirizzo}"
							required="true" requiredMessage="Questo campo è obbligatorio!"
							id="indirizzo" />
						<h:message for="indirizzo" />
					</p>
					<p>
						Mail:
						<h:inputText value="#{fornitoreController.mail}" id="mail" />
						<h:message for="mail" />
					</p>
					<p>
						Telefono:
						<h:inputText value="#{fornitoreController.telefono}" id="telefono" />
						<h:message for="telefono" />
					</p>
					<p>
						<h:commandButton value="Invia"
							action="#{prodottoController.confermaInserimentoFornitore(fornitoreController.createFornitore())}" />
					</p>
				</div>
				<a href='<c:url value="/faces/secured/amministratoreHome.jsp" />'>
					Torna al tuo Pannello di Controllo</a>
			</div>
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