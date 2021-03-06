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
	<h2>
		<b>Il codice inserito risulta gia' associato ad un altro prodotto!</b>
	</h2>
	
			<div class="header">
				<h3>Nuovo prodotto:</h3>
				<p>inserisci i dati</p>
			</div>
			<div class="sep"></div>
			<div class="inputs">
				<div align="left">
					<p>
						Codice:
						<h:inputText value="#{prodottoController.codice}" required="true"
							requiredMessage="Name is mandatory" id="codice" />
						<h:message for="codice" />
					</p>
					<p>
						Nome:
						<h:inputText value="#{prodottoController.nome}" required="true"
							requiredMessage="Code is mandatory" id="nome" />
						<h:message for="nome" />
					</p>

					<p>
						Costo:
						<h:inputText value="#{prodottoController.costo}" required="true"
							requiredMessage="Age is mandatory" id="costo" />
						<h:message for="costo" />
					</p>
					<p>
						Quantita':
						<h:inputText value="#{prodottoController.quantita}"
							required="true" requiredMessage="Number is mandatory"
							id="quantita" />
						<h:message for="quantita" />
					</p>
					<p>
						Descrizione:
						<h:inputTextarea value="#{prodottoController.descrizione}"
							cols="20" rows="9" validatorMessage="max 250 caratteri"
							id="descrizione">
							<f:validateLength maximum="250" />
						</h:inputTextarea>
						<h:message for="descrizione" />
					</p>
					<p>
						<h:commandButton value="Invia"
							action="#{prodottoController.createProdotto}" />
					</p>
				</div>
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