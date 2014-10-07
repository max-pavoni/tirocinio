<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-COMMERCE - ORDINE EVASO!</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
			<c:if test="${amministratoreController.amministratore != null }">
<div>
Ordine evaso con successo!
</div>
<f:view>
<h:form>
<h:commandLink action="#{ordineController.listaOrdiniDaEvadere}"
								value="Torna alla lista degl ordini da evadere" />
								</h:form>
								</f:view>
								</c:if>
</body>
</html>