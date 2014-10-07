<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>E-COMMERCE - REGISTRAZIONE</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color: #a8f7ff;">

	<f:view>
		<h:form id="signup">
		<div class="header">
		<h3>BENVENUTO SU E-COMMERCE</h3>
				<p>inserisci i tuoi dati</p>
				</div>
						<div class="sep"></div>
			<div class="inputs">
				<div align="left">
					<p>
				Nome:
				<h:inputText value="#{clienteController.nome}" required="true"
					requiredMessage="Questo campo e' obbligatorio!" id="nome" />
					<h:message for="nome" />
			</p>
			<p>
				Cognome:
				<h:inputText value="#{clienteController.cognome}" required="true"
					requiredMessage="Questo campo e' obbligatorio!" id="cognome" />
				<h:message for="cognome" />

			</p>
			<p>
				Codice Fiscale:
				<h:inputText value="#{clienteController.codiceFiscale}"
					required="true" requiredMessage="Questo campo e' obbligatorio!"
					id="codiceFiscale" />
				<h:message for="codiceFiscale" />
			</p>
			<p>
				Data di Nascita:
				<h:inputText value="#{clienteController.giorno}" required="true"
					requiredMessage="Questo campo e' obbligatorio!" id="giorno"
					validatorMessage="Il giorno inserito non e' valido!"
					converterMessage="Il valore inserito deve essere un numero!">
					<f:validateLongRange minimum="1" maximum="31" />
					<h:message for="giorno" />
				</h:inputText>
				<h:inputText value="#{clienteController.mese}" required="true"
					requiredMessage="Questo campo e' obbligatorio!" id="mese"
					validatorMessage="Il mese inserito non e' valido!"
					converterMessage="Il valore inserito deve essere un numero!">
					<f:validateLongRange minimum="1" maximum="12" />
					<h:message for="mese" />
				</h:inputText>
				<h:inputText value="#{clienteController.anno}" required="true"
					requiredMessage="Questo campo e' obbligatorio!" id="anno"
					validatorMessage="l'anno inserito non e' valido!"
					converterMessage="Il valore inserito deve essere un numero!">
					<f:validateLongRange minimum="1900" maximum="2014" />
					<h:message for="anno" />
				</h:inputText>
			</p>

			<p>
				Indirizzo:
				<h:inputText value="#{clienteController.indirizzo}" required="true"
					requiredMessage="Questo campo e' obbligatorio!" id="indirizzo" />
				<h:message for="indirizzo" />
			</p>

			<p>
				E-mail:
				<h:inputText value="#{clienteController.email}" required="true"
					requiredMessage="Questo campo e' obbligatorio!" id="email" />
				<h:message for="email" />
			</p>
			<p>
				Password:
				<h:inputSecret value="#{clienteController.password}" required="true"
					requiredMessage="Questo campo e' obbligatorio!"
					validatorMessage="La password deve contenere almeno 8 caratteri."
					id="password">
					<f:validateLength minimum="8" />
				</h:inputSecret>
				<h:message for="password" />
			</p>
			<p>
				<h:commandButton value="Registrati"
					action="#{clienteController.registraCliente}" />

			</p>
			</div>
			<a href='index.html'>Torna alla Home</a>
			</div>
		</h:form>
	</f:view>
</body>
</html>