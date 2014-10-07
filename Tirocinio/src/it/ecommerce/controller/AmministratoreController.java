package it.ecommerce.controller;


import it.ecommerce.model.Amministratore;
import it.ecommerce.model.AmministratoreFacade;

import java.io.Serializable;
import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.persistence.NoResultException;

@ManagedBean
@SessionScoped
public class AmministratoreController {

	private static String predefinitoPin = "admin";
	private static String predefinitaPass = "admin";

	@ManagedProperty(value="#{param.id}")
	private Long id;
	private String nome;
	private String cognome;
	private String pin;
	private String password;
	private Amministratore amministratore;
	private List<Amministratore> amministratori;

	@EJB(beanName="amministratoreFacade")
	private AmministratoreFacade amministratoreFacade;


	public String login() {
		this.amministratore = amministratoreFacade.findAdminByPin(this.pin);

		if (AmministratoreController.predefinitoPin.equals(this.pin)) {

			if (this.amministratore != null) {

				if(this.password.equals(this.amministratore.getPassword()))
					return "amministratoreHome";
				else
					return "riprovaLoginAdmin";
			}

			else {

				if(this.password.equals(AmministratoreController.predefinitaPass)) {
					try{
						this.amministratore = this.amministratoreFacade.createAmministratore("nomeDefault", "cognomeDefault", this.pin, this.password);
						return "amministratoreHome";
					}
					catch(Exception e) {
						return "erroreAdmin";
					}
				}
				else 
					return "riprovaLoginAdmin";
			}
		}


		else { 

			if(this.amministratore != null) {
				if(this.password.equals(this.amministratore.getPassword()))
					return "amministratoreHome";
				else
					return "riprovaLoginAdmin";

			}
			else {
				return "riprovaLoginAdmin";
			}
		}

	}


	public String logout() {
		this.amministratore = null;
		this.pin = null;
		return "logout";
	}

	public String registraAmministratore() {
		try{
			amministratoreFacade.createAmministratore(this.nome, this.cognome, this.pin, this.password);
			return "amministratoreCreato";
		}
		catch(Exception e) {
			return "erroreAdmin";
		}

	}

	public Amministratore getAmministratore() {
		return amministratore;
	}


	public void setAmministratore(Amministratore amministratore) {
		this.amministratore = amministratore;
	}

	public List<Amministratore> getAmministratori() {
		return amministratori;
	}
	public void setAmministratori(List<Amministratore> amministratori) {
		this.amministratori = amministratori;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getPin() {
		return pin;
	}
	public void setPin(String pin) {
		this.pin = pin;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public AmministratoreController() { }

}
