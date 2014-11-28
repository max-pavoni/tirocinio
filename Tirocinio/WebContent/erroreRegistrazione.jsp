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
<div>
				Nome:
				<h:inputText value="#{clienteController.nome}" required="true"
					requiredMessage="Questo campo e' obbligatorio!" id="nome" />
				<h:message for="nome" />
			</div>
			<div>
				Cognome:
				<h:inputText value="#{clienteController.cognome}" required="true"
					requiredMessage="Questo campo e' obbligatorio!" id="cognome" />
				<h:message for="cognome" />

			</div>
			<div>
				Codice Fiscale:
				<h:inputText value="#{clienteController.codiceFiscale}"
					required="true" requiredMessage="Questo campo e' obbligatorio!"
					id="codiceFiscale" />
				<h:message for="codiceFiscale" />
			</div>
			<div>
				Data di Nascita:
				<h:inputText value="#{clienteController.giorno}" required="true"
					requiredMessage="Questo campo e' obbligatorio!" id="giorno"
					validatorMessage="Il giorno inserito non e' valido!"
					converterMessage="Il valore inserito deve essere un numero!">
					<f:validateLongRange minimum="1" maximum="31" />
					<h:message for="giorno" />
				</h:inputText>
				<h:inputText value="#{clienteController.mese}" required="true"
					requiredMessage="Questo campo e' obbligatorio!" id="mese"
					validatorMessage="Il mese inserito non e' valido!"
					converterMessage="Il valore inserito deve essere un numero!">
					<f:validateLongRange minimum="1" maximum="12" />
					<h:message for="mese" />
				</h:inputText>
				<h:inputText value="#{clienteController.anno}" required="true"
					requiredMessage="Questo campo e' obbligatorio!" id="anno"
					validatorMessage="l'anno inserito non e' valido!"
					converterMessage="Il valore inserito deve essere un numero!">
					<f:validateLongRange minimum="1900" maximum="2014" />
					<h:message for="anno" />
				</h:inputText>
			</div>

			<div>
				Indirizzo:
				<h:inputText value="#{clienteController.indirizzo}" required="true"
					requiredMessage="Questo campo e' obbligatorio!" id="indirizzo" />
				<h:message for="indirizzo" />
			</div>

			<div>
				E-mail:
				<h:inputText value="#{clienteController.email}" required="true"
					requiredMessage="Questo campo e' obbligatorio!" id="email" />
				<h:message for="email" />
			</div>
			<div>
				Password:
				<h:inputSecret value="#{clienteController.password}" required="true"
					requiredMessage="Questo campo e' obbligatorio!"
					validatorMessage="La password deve contenere almeno 8 caratteri."
					id="password">
					<f:validateLength minimum="8" />
				</h:inputSecret>
				<h:message for="password" />
			</div>
			<div>
				<h:commandButton value="Registrati"
					action="#{clienteController.registraCliente}" />

			</div>
			<li><a href='index.html'>Torna alla Home</a></li>
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