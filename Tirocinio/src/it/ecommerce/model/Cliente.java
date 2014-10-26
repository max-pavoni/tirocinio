package it.ecommerce.model;


import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@NamedQuery(name = "trovaCliente", query = "SELECT c FROM Cliente c WHERE c.email = :email")
public class Cliente
{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column
	private Long id;
	@Column(nullable=false)
	private String nome;
	@Column(nullable=false)
	private String cognome;
	@Column(nullable=false)
	private String codiceFiscale;
	@Column(nullable=false, unique=true)
	private String email;
	@Column(nullable=false)
	private String indirizzo;
	@Column
	private Date dataRegistrazione;
	@Column(nullable=false)
	private String password;
	@Column
	private Date dataNascita;
	@OneToMany(mappedBy="cliente", cascade={CascadeType.REMOVE})
	private List<Ordine> ordini;

	public Cliente() {}

	public Cliente(String nome, String cognome, String codiceFiscale, String indirizzo, Date dataNascita, Date dataRegistrazione, String mail,String password)
	{
		this.nome = nome;
		this.cognome = cognome;
		this.codiceFiscale = codiceFiscale;
		this.email = mail;
		this.indirizzo = indirizzo;
		this.dataNascita = dataNascita;
		this.password = password;
		this.dataRegistrazione = dataRegistrazione;
	}

	public Long getId()
	{
		return this.id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public String getNome()
	{
		return this.nome;
	}

	public void setNome(String nome)
	{
		this.nome = nome;
	}

	public String getCognome()
	{
		return this.cognome;
	}

	public void setCognome(String cognome)
	{
		this.cognome = cognome;
	}

	public String getCodiceFiscale()
	{
		return this.codiceFiscale;
	}

	public void setCodiceFiscale(String codiceFiscale)
	{
		this.codiceFiscale = codiceFiscale;
	}

	public String getMail()
	{
		return this.email;
	}

	public void setMail(String mail)
	{
		this.email = mail;
	}

	public String getIndirizzo()
	{
		return this.indirizzo;
	}

	public void setIndirizzo(String indirizzo)
	{
		this.indirizzo = indirizzo;
	}

	public Date getDataRegistrazione()
	{
		return this.dataRegistrazione;
	}

	public void setDataRegistrazione(Date dataRegistrazione)
	{
		this.dataRegistrazione = dataRegistrazione;
	}

	public Date getDataNascita()
	{
		return this.dataNascita;
	}

	public void setDataNascita(Date dataNascita)
	{
		this.dataNascita = dataNascita;
	}

	public List<Ordine> getOrdini()
	{
		return this.ordini;
	}

	public void setOrdini(List<Ordine> ordini)
	{
		this.ordini = ordini;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((codiceFiscale == null) ? 0 : codiceFiscale.hashCode());
		result = prime * result + ((cognome == null) ? 0 : cognome.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
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
		Cliente other = (Cliente) obj;
		if (codiceFiscale == null) {
			if (other.codiceFiscale != null)
				return false;
		} else if (!codiceFiscale.equals(other.codiceFiscale))
			return false;
		if (cognome == null) {
			if (other.cognome != null)
				return false;
		} else if (!cognome.equals(other.cognome))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		return true;
	}




}
