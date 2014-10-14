<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>E-COMMERCE - DETTAGLI ORDINE</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<f:view>
		<h3>DETTAGLI ORDINE</h3>
		</br>
		<h:form>


			
				<div><b>Utente: ${ordineController.ordine.cliente.nome} ${ordineController.ordine.cliente.cognome}</b></div>
			</br>
				<table>
					<tr>
						<th align="left">Codice</th>
						<th align="left">Nome</th>
						<th align="left">Quantita'</th>
						<th align="left">Costo</th>
						<th align="left">Totale parziale</th>
						<th></th>
						<th></th>
					</tr>
					<c:forEach var="riga"
						items="#{ordineController.ordine.righeOrdine}">
						<tr>
							<td align="left"><h:commandLink action="#{prodottoController.findProdotto(riga.prodotto.id)}" value="#{riga.prodotto.codice}"/></td>
							<td align="left">${riga.prodotto.nome}</td>
							<td align="left">${riga.quantita}</td>
							<td align="left">${riga.prodotto.costo} $</td>
							<td align="left">${riga.costoTotale} $</td>
							<c:if test="${ordineController.ordine.chiuso == false}">
							<c:if test="${clienteController.cliente != null}">
							<td><h:commandButton action="#{rigaOrdineController.getRigaOrdine(riga.id)}" value="Modifica"/></td>
							<td><h:commandButton action="#{rigaOrdineController.rimuoviRigaOrdine(riga.id, ordineController, ordineController.ordine.id)}" value="Rimuovi"/></td>
							</c:if>
							</c:if>
						</tr>
					</c:forEach>
					<tr></tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<th align="left">Costo Totale =</th>
						<th align="left">${ordineController.ordine.costoTotale} $</th>
					</tr>
				</table>


			<c:choose>
			<c:when test="${clienteController.cliente != null}">
			<ul>
									<li><h:commandLink action="#{prodottoController.listaProdotti}"
								value="Continua ad acquistare" /></li>
				<li><h:commandLink
						action="#{ordineController.listaOrdini(clienteController.cliente)}"
						value="Torna allo storico dei tuoi ordini" /></li>
				<li><a href='<c:url value="/faces/private/clienteHome.jsp" />'>Torna
						alla Home</a></li>
			</ul>
			</c:when>
			<c:otherwise>
						<ul>
									<li><h:commandLink action="#{ordineController.listaOrdiniDaEvadere}"
								value="Torna alla lista degli ordini da evadere" /></li>

			</ul>
			</c:otherwise>
			</c:choose>
		</h:form>
	</f:view>
</body>
</html>