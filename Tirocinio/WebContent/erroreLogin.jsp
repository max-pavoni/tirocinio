<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-COMMERCE - OOPS!</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<f:view>
		<c:if test="${clienteController.cliente != null }">
			<h:form>
				<div>Le credenziali da te inserite non sono corrette! Riprova:</div>
				<div>
					e-mail:
					<h:inputText value="#{clienteController.email}" required="true"
						requiredMessage="Questo campo è obbligatorio!" id="email" />
					<h:message for="email" />
					password:
					<h:inputSecret value="#{clienteController.password}"
						required="true" requiredMessage="Questo campo è obbligatorio!">
					</h:inputSecret>
					<h:message for="password" />
				</div>
				<div align="center">
					<h:commandButton id="bottone" value="login"
						action="#{clienteController.login}" />
				</div>
			</h:form>
		</c:if>
	</f:view>
</body>
</html>