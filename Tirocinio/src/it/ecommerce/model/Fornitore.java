package it.ecommerce.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="fornitori")
@NamedQuery(name = "trovaFornitoreByNome", query = "SELECT f FROM Fornitore f WHERE f.nome = :nome")
public class Fornitore
{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column
	private Long id;
	@Column(nullable=false, unique=true)
	private String nome;
	@Column(nullable=false)
	private String iva;
	@Column(nullable=false)
	private String indirizzo;
	@Column
	private String mail;
	@Column
	private String telefono;
	@ManyToMany(cascade = {CascadeType.MERGE})
	private List<Prodotto> prodotti;

	public Fornitore() {}

	public Fornitore(String nome, String iva, String indirizzo, String mail, String telefono)
	{
		this.nome = nome;
		this.iva = iva;
		this.indirizzo = indirizzo;
		this.mail = mail;
		this.telefono = telefono;
		this.prodotti = new ArrayList<Prodotto>();
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

	public String getIva()
	{
		return this.iva;
	}

	public void setIva(String iva)
	{
		this.iva = iva;
	}

	public String getIndirizzo()
	{
		return this.indirizzo;
	}

	public void setIndirizzo(String indirizzo)
	{
		this.indirizzo = indirizzo;
	}

	public String getMail()
	{
		return this.mail;
	}

	public void setMail(String mail)
	{
		this.mail = mail;
	}

	public String getTelefono()
	{
		return this.telefono;
	}

	public void setTelefono(String telefono)
	{
		this.telefono = telefono;
	}

	public List<Prodotto> getProdotti()
	{
		return this.prodotti;
	}

	public void setProdotti(List<Prodotto> prodotti)
	{
		this.prodotti = prodotti;
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
		Fornitore other = (Fornitore) obj;
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
