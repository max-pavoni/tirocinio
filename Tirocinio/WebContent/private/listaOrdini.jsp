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

					<div class="col-md-9">
				<div class="thumbnail">
			<h3>Lista Ordini Aperti:</h3>
			<table>
				<tr>
					<th>Codice </th>
					<th>Data Apertura </th>
					<th>Costo totale </th>
					<th></th>

					<c:forEach var="ordine" items="#{ordineController.ordini}">
						<c:if test="${ordine.chiuso == false}">
							<tr>
								<td align=center><h:commandLink
										action="#{ordineController.findOrdine(ordine.id)}"
										value="#{ordine.id}">
									</h:commandLink></td>
								<td>${ordine.dataApertura}</td>
								<td align=right>${ordine.costoTotale}$</td>
								<td><c:if test="${ordine.costoTotale > 0}">
										<h:commandButton
											action="#{ordineController.chiudiOrdine(ordine)}"
											value="Chiudi ordine" />
									</c:if></td>

							</tr>
						</c:if>
					</c:forEach>
			</table>
			</br>
			<h3>Lista Ordini Chiusi:</h3>
			<table>
				<tr>
					<th>Codice Ordine</th>
					<th>Data Apertura</th>
					<th>Data Chiusura</th>
					<th>Costo totale</th>
					<th>Evaso</th>

					<c:forEach var="ordine" items="#{ordineController.ordini}">
						<c:if test="${ordine.chiuso != false }">
							<tr>
								<td align=center><h:commandLink
										action="#{ordineController.findOrdine(ordine.id)}"
										value="#{ordine.id}">
									</h:commandLink></td>
								<td>${ordine.dataApertura}</td>
								<td>${ordine.dataChiusura}</td>
								<td align=right>${ordine.costoTotale}$</td>
								<td align=center><c:choose>
										<c:when test="${ordine.evaso == true}">
						SI
						</c:when>
										<c:otherwise>
						NO
						</c:otherwise>
									</c:choose></td>

							</tr>
						</c:if>
					</c:forEach>
			</table>
			<a href='<c:url value="/faces/private/clienteHome.jsp" />'>Torna
				alla Home</a>
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