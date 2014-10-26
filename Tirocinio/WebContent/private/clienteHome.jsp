<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<link href="/Tirocinio/faces/css/style.css" rel="stylesheet" type="text/css" />
<title>E-COMMERCE - LA TUA HOME</title>
</head>
<body>
	<f:view>
		<h1>Ciao ${clienteController.cliente.nome}!</h1>
		<h2>Cosa vuoi fare?</h2>
		<ul>
			<h:form>
				<li><h:commandLink action="#{prodottoController.listaProdotti}"
						value="Vai al catalogo" /></li>
				<li><h:commandLink
						action="#{ordineController.listaOrdini(clienteController.cliente)}"
						value="Guarda lo storico dei tuoi ordini" /></li>
				<li><h:commandLink action="#{clienteController.logout}"
						value="Logout" /></li>
			</h:form>
		</ul>

	</f:view>
</html>