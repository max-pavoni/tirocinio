<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>E-COMMERCE - PANNELLO AMMINISTRATORE</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<f:view>
		<h:form>

			<h1>Bentornato ${amministratoreController.amministratore.nome}!</h1>
			<h2>Pannello di controllo:</h2>
			<ul>
				<li><a
					href='<c:url value="/faces/secured/aggiungiProdotto.jsp" />'>Aggiungi
						un Prodotto</a></li>
				<li><h:commandLink action="#{prodottoController.listaProdotti}"
						value="Vai al catalogo" /></li>
				<li><h:commandLink action="#{partitaController.listaPartite}"
						value="Aggiungi cliente" /></li>
				<li><h:commandLink
						action="#{ordineController.listaOrdiniDaEvadere}"
						value="Evadi ordini" /></li>
				<li><a
					href='<c:url value="/faces/registrazioneAmministratore.jsp" />'>
						Registra un altro Amministratore</a></li>
				<li><h:commandLink action="#{amministratoreController.logout}"
						value="Logout" /></li>

			</ul>

		</h:form>
	</f:view>
</html>