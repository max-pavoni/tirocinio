package it.ecommerce.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.NamedQueries;

@Entity
@NamedQueries({
	@NamedQuery(name = "trovaRigheOrdineByProdottoAndOrdine", query = "SELECT r FROM RigaOrdine r WHERE r.prodotto = :prodotto AND r.ordine = :ordine"),
	@NamedQuery(name = "trovaRigheOrdineByProdotto", query = "SELECT r FROM RigaOrdine r WHERE r.prodotto = :prodotto")})
@Table(name="righeOrdine")
public class RigaOrdine
{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column
	private Long id;
	@Column(nullable=false)
	private Integer quantita;
	@Column(nullable=false)
	private Double costoTotale;
	@ManyToOne(cascade = {CascadeType.MERGE})
	private Ordine ordine;
	@ManyToOne(fetch=FetchType.EAGER)
	private Prodotto prodotto;

	public RigaOrdine () {}

	public RigaOrdine(Prodotto prodotto, Ordine ordine, Integer quantita) {
		this.ordine = ordine; 
		this.prodotto = prodotto;
		this.quantita = quantita;
		this.costoTotale = this.prodotto.getCosto()*this.quantita;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getQuantita() {
		return quantita;
	}

	public void setQuantita(Integer quantita) {
		this.quantita = quantita;
	}

	public Double getCostoTotale() {
		return this.costoTotale;
	}

	public void setCostoTotale(Double costoTotale) {
		this.costoTotale = costoTotale;
	}



	public Ordine getOrdine() {
		return ordine;
	}

	public void setOrdine(Ordine ordine) {
		this.ordine = ordine;
	}

	public Prodotto getProdotto() {
		return prodotto;
	}

	public void setProdotto(Prodotto prodotto) {
		this.prodotto = prodotto;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((costoTotale == null) ? 0 : costoTotale.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		RigaOrdine other = (RigaOrdine) obj;
		if (costoTotale == null) {
			if (other.costoTotale != null)
				return false;
		} else if (!costoTotale.equals(other.costoTotale))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}



}