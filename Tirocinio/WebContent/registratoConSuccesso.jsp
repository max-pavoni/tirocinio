<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>E-COMMERCE - REGISTRAZIONE EFFETTUATA!</title>
<meta http-equiv="refresh" content="2; url=faces/clienteHome.jsp" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color: #a8f7ff;">
			<c:if test="${clienteController.cliente != null }">
	<f:view>

		<h1>Registrazione effettuata con successo!</h1>
		<h2>(A breve verrai reindirizzato alla tua Home)</h2>

	</f:view>
	</c:if>
</body>
</html>