<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<f:view>
<h:form>
<h1>E-COMMERCE</h1>
<h3>Catalogo:</h3>
<table>
				<tr>
					<th>Codice</th>
					<th>Nome Prodotto</th>
					<th>Costo</th>
					<th></th>
					
				<c:forEach var="prodotto" items="#{prodottoController.prodotti}">
					<tr>
						<td align=center>${prodotto.codice}</td>
						<td align="left"><h:commandLink
								action="#{prodottoController.findProdotto(prodotto.id)}"
								value="#{prodotto.nome}">
							</h:commandLink></td>
						<td align=center>${prodotto.costo}</td>
						<td>
						<c:if test="${amministratoreController.amministratore != null}">
						<h:commandButton
								action="#{prodottoController.rimuoviProdotto(prodotto)}"
								value="Rimuovi"/>
								</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
			<c:choose>
<c:when test="${clienteController.cliente != null}">
					<a href='<c:url value="/faces/private/clienteHome.jsp" />'> Vai
						alla tua Home</a>
						</c:when>
						<c:otherwise>
						<c:choose>

									
<c:when test="${amministratoreController.amministratore != null}">
					<a href='<c:url value="/faces/secured/amministratoreHome.jsp" />'> Vai
						al tuo Pannello di Controllo</a>
						</c:when>
						<c:otherwise>
						<a href='<c:url value="/faces/index.jsp" />'> Torna
						alla Homepage</a>
						</c:otherwise>
						</c:choose>
						</c:otherwise>
				</c:choose>		
				</h:form>
				</f:view>
</body>
</html>