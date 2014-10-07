<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-COMMERCE - OOPS!</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<h2><b>Il nome inserito risulta gia' associato ad un altro fornitore!</b></h2>

	<f:view>
		<h:form id="signup">
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
							<h:inputText value="#{fornitoreController.mail}"
								id="mail" />
							<h:message for="mail" />
						</p>
												<p>
							Telefono:
							<h:inputText value="#{fornitoreController.telefono}"
								id="telefono" />
							<h:message for="telefono" />
						</p>
						<p>
							<h:commandButton value="Invia"
								action="#{prodottoController.confermaInserimentoFornitore(fornitoreController.createFornitore())}" />
						</p>
					</div>
					<a href='<c:url value="/faces/amministratoreHome.jsp" />'>
						Torna al tuo Pannello di Controllo</a>
				</div>
		</h:form>
	</f:view>

</body>
</html>