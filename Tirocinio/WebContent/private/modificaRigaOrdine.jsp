<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>E-COMMERCE - MODIFICA ORDINE</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<f:view>
		<h:form>

			<h3>DETTAGLI PRODOTTO IN ORDINE</h3>
			<div>Codice: ${rigaOrdineController.rigaOrdine.prodotto.codice}</div>
			<div>Nome: ${rigaOrdineController.rigaOrdine.prodotto.nome}</div>
			<div>Costo: ${rigaOrdineController.rigaOrdine.prodotto.costo}</div>
			<div>Quantita': ${rigaOrdineController.rigaOrdine.quantita}</div>




			</br>

			<div>Inserisci la nuova quantita' da ordinare:</div>
			<div>
				<h:inputText value="#{rigaOrdineController.quantita}"
					required="true" requiredMessage="Questo campo e' obbligatorio!"
					id="quantita" validatorMessage="Il valore inserito non e' valido!"
					converterMessage="Il valore inserito deve essere un numero!">
					<f:validateLongRange minimum="1" />
					<h:message for="quantita" />
				</h:inputText>
				<h:commandButton
					action="#{rigaOrdineController.modificaRigaOrdine(rigaOrdineController.rigaOrdine.id)}"
					value="Conferma" />
			</div>

			</br>


			<h:commandLink
				action="#{ordineController.findOrdine(rigaOrdineController.rigaOrdine.ordine.id)}"
				value="Torna all'ordine">
			</h:commandLink>
		</h:form>
	</f:view>
</body>
</html>