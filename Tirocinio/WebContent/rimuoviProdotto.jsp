<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>E-COMMERCE - RIMUOVI PRODOTTO</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
			<c:if test="${amministratoreController.amministratore != null }">
	<f:view>
		<h3>DETTAGLI PRODOTTO</h3>
		<div>Codice: ${prodottoController.prodotto.codice}</div>
		<div>Nome: ${prodottoController.prodotto.nome}</div>
		<div>Costo': ${prodottoController.prodotto.costo}</div>



		</br>

		<div>Stai per rimuovere questo prodotto dal catalogo. Nessun cliente potra' piu' ordinare questo prodotto. Sei
			sicuro?</div>

		</br>

		<h:form>
			<h:commandLink action="#{prodottoController.confermaRimozioneProdotto(prodottoController.prodotto, rigaOrdineController.getRigheOrdineByProdotto(prodottoController.prodotto))}"
				value="Rimuovi Prodotto">
			</h:commandLink>
			<h:commandLink action="#{prodottoController.listaProdotti}"
				value="Torna al catalogo">
			</h:commandLink>
		</h:form>
	</f:view>
	</c:if>
</body>
</html>