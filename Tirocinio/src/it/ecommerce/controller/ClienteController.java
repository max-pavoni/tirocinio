package it.ecommerce.controller;

import it.ecommerce.model.Cliente;
import it.ecommerce.model.ClienteFacade;



import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class ClienteController {

	@ManagedProperty(value="#{param.id}")
	private Long id;
	private String email;
	private String password;
	private String nome;
	private String cognome;
	private String codiceFiscale;
	private String indirizzo;
	private Date dataRegistrazione;
	private Integer giorno;
	private Integer mese;
	private Integer anno;
	private Date dataNascita;
	private Cliente cliente;
	private List<Cliente> clienti;

	@EJB(beanName="cFacade")
	private ClienteFacade clienteFacade;

	public ClienteController() {}

	public String registraCliente(){
		this.dataNascita = new Date(this.anno - 1900, this.mese - 1, this.giorno);
		try {
			this.cliente = clienteFacade.createCliente(this.nome, this.cognome, this.codiceFiscale, this.indirizzo, this.dataNascita, this.email, this.password);
		}
		catch(Exception e) {
			return "erroreRegistrazione";
		}
		this.nome = null;
		this.codiceFiscale = null;
		this.giorno = null;
		this.mese = null;
		this.anno = null;
		this.indirizzo = null;
		this.cognome = null;
		this.email = null;
		this.password = null;
		return "registrato";
	}

	public String login(){
		this.cliente = clienteFacade.autentica(this.email, this.password);

		if(this.cliente!=null) {

			return "logged";
		}
		else {
			return "erroreLogin";
		}
	}

	public String logout() {

		this.cliente = null;
		this.email = null;

		return "logout";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getCodiceFiscale() {
		return codiceFiscale;
	}

	public void setCodiceFiscale(String codiceFiscale) {
		this.codiceFiscale = codiceFiscale;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public Date getDataRegistrazione() {
		return dataRegistrazione;
	}

	public void setDataRegistrazione(Date dataRegistrazione) {
		this.dataRegistrazione = dataRegistrazione;
	}

	public Date getDataNascita() {
		return dataNascita;
	}

	public void setDataNascita(Date dataNascita) {
		this.dataNascita = dataNascita;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public List<Cliente> getClienti() {
		return clienti;
	}

	public void setClienti(List<Cliente> clienti) {
		this.clienti = clienti;
	}

	public ClienteFacade getClienteFacade() {
		return clienteFacade;
	}

	public void setClienteFacade(ClienteFacade clienteFacade) {
		this.clienteFacade = clienteFacade;
	}

	public Integer getGiorno() {
		return giorno;
	}

	public void setGiorno(Integer giorno) {
		this.giorno = giorno;
	}

	public Integer getMese() {
		return mese;
	}

	public void setMese(Integer mese) {
		this.mese = mese;
	}

	public Integer getAnno() {
		return anno;
	}

	public void setAnno(Integer anno) {
		this.anno = anno;
	}




}


