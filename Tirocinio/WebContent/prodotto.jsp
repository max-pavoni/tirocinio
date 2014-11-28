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
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-homepage.css" rel="stylesheet">

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
			<c:import url="menuBar.jsp" />

			<div class="col-md-9">

				<div class="thumbnail">
					<img class="img-responsive" src="http://placehold.it/800x300"
						alt="">
					<div class="caption-full">
						<h4 class="pull-right">Costo:
							${prodottoController.prodotto.costo}$</h4>
						<h4>
							<p>${prodottoController.prodotto.nome}</p>
						</h4>
						<p>Descrizione: ${prodottoController.prodotto.descrizione}</p>
						<c:if test="${amministratoreController.amministratore != null }">
						<p>Fornitori:</p>
						<p>
						<c:forEach var="fornitore" items="#{prodottoController.prodotto.fornitori}">
						${fornitore.nome}
						</c:forEach>
						</p>
						</c:if>
					<c:if test="${clienteController.cliente != null}">
					<table>
						<tr>
							<th></th>
							<th>Quantita':</th>
						</tr>
						<tr>
							<td class="pull-right"><h:commandButton 
									action="#{rigaOrdineController.createRigaOrdine(prodottoController.prodotto, ordineController.getOrdineAperto(clienteController.cliente))}"
									value="Aggiungi al carrello">
								</h:commandButton></td>
							<td><h:inputText value="#{rigaOrdineController.quantita}"
									id="quantita"
									validatorMessage="Il valore inserito non e' valido!"
									converterMessage="Il valore inserito deve essere un numero!">
									<f:validateLongRange minimum="1" />
									<h:message for="quantita" />
								</h:inputText></td>
					</table>

				</c:if>
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
					</div>
					
					<div class="ratings">
						<p class="pull-right">3 reviews</p>
						<p>
							<span class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star-empty"></span> 4.0 stars
						</p>
					</div>
				</div>



			</div>

		</div>

	</div>
	<!-- /.container -->

	<div class="container">

		<hr>

		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; Your Website 2014</p>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
</h:form>
</f:view>
</body>

</html>
