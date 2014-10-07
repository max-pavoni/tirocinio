<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>E-COMMERCE - DETTAGLI PRODOTTO</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<f:view>


		<h:form id="signup">
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

				<h:commandLink action="#{fornitoreController.eliminaFornitore()}"
					value="Elimina Fornitore">
				</h:commandLink>
			</div>
			<a href='<c:url value="/faces/amministratoreHome.jsp" />'> Vai al
				tuo Pannello di Controllo</a>
		</h:form>
	</f:view>
</body>
</html>