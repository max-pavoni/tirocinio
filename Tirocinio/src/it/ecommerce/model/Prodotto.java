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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@NamedQueries({
@NamedQuery(name = "trovaProdotti", query = "SELECT p FROM Prodotto p ORDER BY p.codice ASC"),
@NamedQuery(name = "rimuoviProdottoById", query = "DELETE FROM Prodotto p WHERE p.id = :id")})
@Table(name="prodotti")
public class Prodotto
{
  @Id
  @GeneratedValue(strategy=GenerationType.AUTO)
  @Column
  private Long id;
  @Column(nullable=false, unique=true)
  private String codice;
  @Column(nullable=false)
  private String nome;
  @Column(nullable=false)
  private Double costo;
  @Column(nullable=false)
  private Integer quantita;
  @Column
  private String descrizione;
  @ManyToMany(mappedBy="prodotti", cascade = {CascadeType.MERGE},  fetch=FetchType.EAGER)
  private List<Fornitore> fornitori;
  @OneToMany(mappedBy="prodotto", fetch=FetchType.EAGER)
  private List<RigaOrdine> righeOrdine;
  
  public Prodotto() {}
  
  public Prodotto(String codice, String nome, Double costo, Integer quantita, String descrizione)
  {
    this.codice = codice;
    this.nome = nome;
    this.costo = costo;
    this.quantita = quantita;
    this.descrizione = descrizione;
    this.fornitori = new ArrayList<Fornitore>();
  }
  
  public Long getId()
  {
    return this.id;
  }
  
  public void setId(Long id)
  {
    this.id = id;
  }
  
  public String getCodice()
  {
    return this.codice;
  }
  
  public void setCodice(String codice)
  {
    this.codice = codice;
  }
  
  public String getNome()
  {
    return this.nome;
  }
  
  public void setNome(String nome)
  {
    this.nome = nome;
  }
  
  public Double getCosto()
  {
    return this.costo;
  }
  
  public void setCosto(Double costo)
  {
    this.costo = costo;
  }
  
  public Integer getQuantita()
  {
    return this.quantita;
  }
  
  public void setQuantita(Integer quantita)
  {
    this.quantita = quantita;
  }
  
  public String getDescrizione()
  {
    return this.descrizione;
  }
  
  public void setDescrizione(String descrizione)
  {
    this.descrizione = descrizione;
  }
  
  public List<Fornitore> getFornitori()
  {
    return this.fornitori;
  }
  
  public void setFornitori(List<Fornitore> fornitori)
  {
    this.fornitori = fornitori;
  }
  

  
  public List<RigaOrdine> getRigheOrdine() {
	return righeOrdine;
}

public void setRigheOrdine(List<RigaOrdine> righeOrdine) {
	this.righeOrdine = righeOrdine;
}

@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((codice == null) ? 0 : codice.hashCode());
	result = prime * result + ((costo == null) ? 0 : costo.hashCode());
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
	Prodotto other = (Prodotto) obj;
	if (codice == null) {
		if (other.codice != null)
			return false;
	} else if (!codice.equals(other.codice))
		return false;
	if (costo == null) {
		if (other.costo != null)
			return false;
	} else if (!costo.equals(other.costo))
		return false;
	if (nome == null) {
		if (other.nome != null)
			return false;
	} else if (!nome.equals(other.nome))
		return false;
	return true;
}


  

}
