<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Shop Item - Start Bootstrap Template</title>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/shop-homepage.css" rel="stylesheet">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<f:view>
		<h:form>
			<!-- Page Content -->
			<div class="container">

				<div class="row">
					<c:import url="../menuBar.jsp" />

					<div class="col-md-5">
				<div class="thumbnail">
		<h3>DETTAGLI ORDINE</h3>
		</br>




			<div>
				<b>Utente: ${ordineController.ordine.cliente.nome}
					${ordineController.ordine.cliente.cognome}</b>
			</div>
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
				<c:forEach var="riga" items="#{ordineController.ordine.righeOrdine}">
					<tr>
						<td align="left"><h:commandLink
								action="#{prodottoController.findProdotto(riga.prodotto.id)}"
								value="#{riga.prodotto.codice}" /></td>
						<td align="left">${riga.prodotto.nome}</td>
						<td align="left">${riga.quantita}</td>
						<td align="left">${riga.prodotto.costo}$</td>
						<td align="left">${riga.costoTotale}$</td>
						<c:if test="${ordineController.ordine.chiuso == false}">
							<c:if test="${clienteController.cliente != null}">
								<td><h:commandButton
										action="#{rigaOrdineController.getRigaOrdine(riga.id)}"
										value="Modifica" /></td>
								<td><h:commandButton
										action="#{rigaOrdineController.rimuoviRigaOrdine(riga.id, ordineController, ordineController.ordine.id)}"
										value="Rimuovi" /></td>
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
					<th align="left">${ordineController.ordine.costoTotale}$</th>
				</tr>
			</table>


			<c:choose>
				<c:when test="${clienteController.cliente != null}">
					<ul>
						<li><h:commandLink
								action="#{prodottoController.listaProdotti}"
								value="Continua ad acquistare" /></li>
						<li><h:commandLink
								action="#{ordineController.listaOrdini(clienteController.cliente)}"
								value="Torna allo storico dei tuoi ordini" /></li>
						<li><a
							href='<c:url value="/faces/private/clienteHome.jsp" />'>Torna
								alla Home</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul>
						<li><h:commandLink
								action="#{ordineController.listaOrdiniDaEvadere}"
								value="Torna alla lista degli ordini da evadere" /></li>

					</ul>
				</c:otherwise>
			</c:choose>
	</div>
					</div>
				</div>
			</div>
			<!-- jQuery -->
			<script src="../js/jquery.js"></script>

			<!-- Bootstrap Core JavaScript -->
			<script src="../js/bootstrap.min.js"></script>
		</h:form>

	</f:view>
</body>
</html>