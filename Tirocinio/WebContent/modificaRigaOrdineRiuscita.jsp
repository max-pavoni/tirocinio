<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-COMMERCE - MODIFICA RIUSCITA!</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
		<c:if test="${clienteController.cliente != null }">
	<div>Ordine aggiornato con successo!</div>
	<f:view>
		<h:form>

		
			<h:commandLink
				action="#{ordineController.findOrdine(rigaOrdineController.rigaOrdine.ordine.id)}"
				value="Torna all'ordine" />
								<a href='<c:url value="/faces/clienteHome.jsp" />'> Vai
						alla tua Home</a>
						
		</h:form>
	</f:view>
	</c:if>
</body>
</html>