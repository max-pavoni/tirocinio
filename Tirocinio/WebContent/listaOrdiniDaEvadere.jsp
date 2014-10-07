<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-COMMERCE - ORDINI DA EVADERE</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<f:view>
<h:form>
<c:if test="${amministratoreController.amministratore != null }">
<h1>E-COMMERCE</h1>
<h3>Lista Ordini da Evadere:</h3>
<table>
				<tr>
					<th>Codice Ordine</th>
					<th>Data Apertura</th>
					<th>Data Chiusura</th>
					<th>Costo totale</th>
					<th></th>
					
				<c:forEach var="ordine" items="#{ordineController.ordini}">
					<tr>
						<td align=center><h:commandLink
								action="#{ordineController.findOrdine(ordine.id)}"
								value="#{ordine.id}">
							</h:commandLink>
							</td>
							<td>${ordine.dataApertura}</td>
							<td>${ordine.dataChiusura}</td>
						<td align=right>${ordine.costoTotale}</td>
						<td>
						<c:choose>
						<c:when test="${ordineController.ordineProntoPerEssereEvaso(ordine) == true}">
						<h:commandButton action="#{ordineController.evadiOrdine(ordine.id)}" value="Evadi">
						</h:commandButton></c:when>
						<c:otherwise>
						DISPONIBILITA' IN MAGAZZINO NON SUFFICIENTE
						</c:otherwise>
						</c:choose></td>
						
					</tr>
				</c:forEach>
			</table>
					<a href='<c:url value="/faces/amministratoreHome.jsp" />'> Torna
						al tuo Pannello di Controllo</a>
						</c:if>
				</h:form>
				</f:view>
</body>
</html>