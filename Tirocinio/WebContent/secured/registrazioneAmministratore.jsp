<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="/Tirocinio/faces/css/style.css" rel="stylesheet" type="text/css" />
<title>E-COMMERCE - REGISTRA AMMINISTRATORE</title>
</head>
<body style="background-color: #a8f7ff;">
	<hgroup>
	<h2>inserisci i dati del nuovo Amministratore:</h2>
	</hgroup>
	<f:view>
		<h:form>
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
		</h:form>
	</f:view>
</body>
</html>