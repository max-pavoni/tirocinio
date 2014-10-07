<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-COMMERCE - AGGIUNGI PRODOTTO</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<f:view>
		<h:form id="signup">
			<c:if test="${amministratoreController.amministratore != null }">
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
								requiredMessage="Questo campo è obbligatorio!" id="codice" />
							<h:message for="codice" />
						</p>
						<p>
							Nome:
							<h:inputText value="#{prodottoController.nome}" required="true"
								requiredMessage="Questo campo è obbligatorio!" id="nome" />
							<h:message for="nome" />
						</p>

						<p>
							Costo:
							<h:inputText value="#{prodottoController.costo}" required="true"
								requiredMessage="Questo campo è obbligatorio!" id="costo" />
							<h:message for="costo" />
						</p>
						<p>
							Quantita':
							<h:inputText value="#{prodottoController.quantita}"
								required="true" requiredMessage="Questo campo è obbligatorio!"
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
					<a href='<c:url value="/faces/amministratoreHome.jsp" />'>
						Torna al tuo Pannello di Controllo</a>
				</div>
			</c:if>
		</h:form>
	</f:view>

</body>
</html>