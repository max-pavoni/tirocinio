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
			<h3>Benvenuto su e-Commerce!</h3>
			<ul>
				<li><h:commandLink action="#{prodottoController.listaProdotti}"
						value="Vai al Catalogo Prodotti" /></li>
				<li><a href='<c:url value="/faces/registrazione.jsp" />'>Registrati!</a></li>
			</ul>

			<div class="sep"></div>
			<c:choose>
				<c:when test="${clienteController.cliente == null}">
					<div>
						e-mail:
						<h:inputText value="#{clienteController.email}" 
							 id="email" />
						<h:message for="email" />
						password:
						<h:inputSecret value="#{clienteController.password}">
						</h:inputSecret>
						<h:message for="password" />
					</div>
					<div align="center">
						<h:commandButton id="bottone" value="login"
							action="#{clienteController.login}" />
					</div>
				</c:when>
				<c:otherwise>
					<a href='<c:url value="/faces/clienteHome.jsp" />'>Vai alla tua
						pagina personale</a>

				</c:otherwise>

			</c:choose>
<c:choose>
				<c:when test="${amministratoreController.amministratore == null}">
					<p>
						<a href='<c:url value="/faces/loginAmministratore.jsp" />'>
							Accedi come Amministratore</a>
					</p>
				</c:when>
				<c:otherwise>
					<a href='<c:url value="/faces/amministratoreHome.jsp" />'> Vai
						al Pannello di Controllo</a>
				</c:otherwise>
			</c:choose>

		</h:form>
	</f:view>
</body>
</html>