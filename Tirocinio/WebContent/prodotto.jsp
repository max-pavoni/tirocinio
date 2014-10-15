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
				<h3>DETTAGLI PRODOTTO</h3>
			</div>
			<div align="left">
				<p>Codice: ${prodottoController.prodotto.codice}</p>
				<p>Nome: ${prodottoController.prodotto.nome}</p>
				<p>Costo: ${prodottoController.prodotto.costo}</p>
				<p>Descrizione: ${prodottoController.prodotto.descrizione}</p>
				<table>
					<tr>
						<th>Fornitori:</th>
						<th></th>
					</tr>
					<c:forEach var="fornitore"
						items="#{prodottoController.prodotto.fornitori}">
						<tr>
							<td></td>
							<td><h:commandLink
									action="#{fornitoreController.findFornitoreByNome(fornitore.nome)}"
									value="#{fornitore.nome}" /></td>
						</tr>
					</c:forEach>
				</table>
				</br>

				<c:if test="${clienteController.cliente != null}">
					<table>
						<tr>
							<th></th>
							<th>Quantita'</th>
						</tr>
						<tr>
							<td><h:commandLink
									action="#{rigaOrdineController.createRigaOrdine(prodottoController.prodotto, ordineController.getOrdineAperto(clienteController.cliente))}"
									value="Aggiungi al carrello">
								</h:commandLink></td>
							<td><h:inputText value="#{rigaOrdineController.quantita}"
									id="quantita"
									validatorMessage="Il valore inserito non e' valido!"
									converterMessage="Il valore inserito deve essere un numero!">
									<f:validateLongRange minimum="1" />
									<h:message for="quantita" />
								</h:inputText></td>
					</table>

				</c:if>
			</div>
			<c:if test="${amministratoreController.amministratore != null}">
				<div>
					<h:commandLink
						action="#{prodottoController.findProdottoDaAggiornare(prodottoController.prodotto.id)}"
						value="Modifica prodotto" />
				</div>
				<div>
					<h:commandLink action="#{prodottoController.aggiungiFornitore()}"
						value="Aggiungi Fornitore" />
				</div>
				<div>
					<h:commandLink
						action="#{prodottoController.rimuoviFornitoreDaProdotto()}"
						value="Rimuovi Fornitore" />
				</div>
			</c:if>
			<div>
				<a href='<c:url value="/faces/prodotti.jsp" />'>Torna al
					catalogo</a>
			</div>
		</h:form>
	</f:view>
</body>
</html>