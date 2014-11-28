package it.ecommerce.controller;

import it.ecommerce.model.Fornitore;
import it.ecommerce.model.FornitoreFacade;
import it.ecommerce.model.Prodotto;
import it.ecommerce.model.ProdottoFacade;

import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class FornitoreController {

	@ManagedProperty("#{param.id}")
	private Long id;
	private String nome;
	private String iva;
	private String indirizzo;
	private String mail;
	private String telefono;
	private Fornitore fornitore;
	private List<Prodotto> prodotti;
	@EJB(beanName="fFacade")
	private FornitoreFacade fornitoreFacade;

	public FornitoreController() {};

	public Fornitore createFornitore() {

		try {
			this.fornitore = this.fornitoreFacade.createFornitore(this.nome, this.iva, this.indirizzo, this.mail, this.telefono);
		}
		catch(Exception e) {
			return this.fornitoreFacade.findFornitoreByNome(this.nome);
		}


		return this.fornitore;
	}

	public String eliminaFornitore() {
		this.fornitoreFacade.eliminaFornitore(this.fornitore);
		return "fornitoreEliminato";
	}


	public String findFornitoreByNome(String nome) {

		this.fornitore = this.fornitoreFacade.findFornitoreByNome(nome);

		return "fornitore";

	}

	public Fornitore getFornitoreByNome(String nome) {

		return this.fornitoreFacade.findFornitoreByNome(nome);

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
	public String getIva() {
		return iva;
	}
	public void setIva(String iva) {
		this.iva = iva;
	}
	public String getIndirizzo() {
		return indirizzo;
	}
	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public List<Prodotto> getProdotti() {
		return prodotti;
	}
	public void setProdotti(List<Prodotto> prodotti) {
		this.prodotti = prodotti;
	}
	public FornitoreFacade getFornitoreFacade() {
		return fornitoreFacade;
	}
	public void setFornitoreFacade(FornitoreFacade fornitoreFacade) {
		this.fornitoreFacade = fornitoreFacade;
	}



	public Fornitore getFornitore() {
		return fornitore;
	}

	public void setFornitore(Fornitore fornitore) {
		this.fornitore = fornitore;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((indirizzo == null) ? 0 : indirizzo.hashCode());
		result = prime * result + ((iva == null) ? 0 : iva.hashCode());
		result = prime * result + ((mail == null) ? 0 : mail.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FornitoreController other = (FornitoreController) obj;
		if (indirizzo == null) {
			if (other.indirizzo != null)
				return false;
		} else if (!indirizzo.equals(other.indirizzo))
			return false;
		if (iva == null) {
			if (other.iva != null)
				return false;
		} else if (!iva.equals(other.iva))
			return false;
		if (mail == null) {
			if (other.mail != null)
				return false;
		} else if (!mail.equals(other.mail))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		return true;
	}




}
