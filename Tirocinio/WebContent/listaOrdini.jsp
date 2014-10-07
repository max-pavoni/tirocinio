<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-COMMERCE - LISTA ORDINI</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<f:view>
<h:form>
<c:if test="${clienteController.cliente != null }">
<h1>E-COMMERCE</h1>
<h3>Lista Ordini Aperti:</h3>
<table>
				<tr>
					<th>Codice Ordine</th>
					<th>Data Apertura</th>
					<th>Costo totale</th>
					<th></th>
					
				<c:forEach var="ordine" items="#{ordineController.ordini}">
					<c:if test="${ordine.chiuso == false}">
					<tr>
						<td align=center><h:commandLink
								action="#{ordineController.findOrdine(ordine.id)}"
								value="#{ordine.id}">
							</h:commandLink>
							</td>
							<td>${ordine.dataApertura}</td>
						<td align=right>${ordine.costoTotale} $</td>
						<td>
						<h:commandButton action="#{ordineController.chiudiOrdine(ordine)}" value="Chiudi ordine"/>
						</td>
						
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
							</h:commandLink>
							</td>
							<td>${ordine.dataApertura}</td>
							<td>${ordine.dataChiusura}</td>
						<td align=right>${ordine.costoTotale} $</td>
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
			<a href='<c:url value="/faces/clienteHome.jsp" />'>Torna
						alla Home</a>
</c:if>
				</h:form>
				</f:view>
</body>
</html>