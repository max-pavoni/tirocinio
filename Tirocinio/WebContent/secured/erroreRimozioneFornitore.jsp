<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-COMMERCE - OOPS! - RIMUOVI FORNITORE</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<h2>
		<b>Non risulta nessun fornitore con tale nome associato a questo
			prodotto!</b>
	</h2>
	<f:view>
		<h:form id="signup">
			<div class="header">
				<h3>Rimuovi fornitore:</h3>
				<p>inserisci di nuovo il nome del Fornitore da rimuovere</p>
			</div>
			<div class="sep"></div>
			<div class="inputs">
				<div align="left">
					<p>
						<h:inputText value="#{fornitoreController.nome}" required="true"
							requiredMessage="Questo campo è obbligatorio!" id="nome" />
						<h:message for="nome" />
					</p>
					<p>
						<h:commandButton value="Invia"
							action="#{prodottoController.confermaRimozioneFornitoreDaProdotto(fornitoreController.getFornitoreByNome(nome))}" />
					</p>
				</div>
			</div>
		</h:form>
	</f:view>
</body>
</html>