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
<div>
Fornitore inserito con successo!
</div>
<f:view>
<h:form>

<h:commandLink action="#{prodottoController.aggiungiFornitore(prodottoController.prodotto)}"
								value="Aggiungi un altro fornitore al prodotto" />

<h:commandLink action="#{prodottoController.listaProdotti}"
								value="Torna al catalogo" />
								</h:form>
								</f:view>
</body>
</html>