package it.ecommerce.model;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@NamedQueries({
@NamedQuery(name = "trovaOrdiniByCliente", query = "SELECT o FROM Ordine o WHERE o.cliente = :cliente ORDER BY o.dataApertura DESC"),
@NamedQuery(name = "trovaOrdineApertoByCliente", query = "SELECT o FROM Ordine o WHERE o.cliente = :cliente AND o.chiuso = false ORDER BY o.dataApertura DESC"),
@NamedQuery(name = "trovaOrdiniDaEvadere", query = "SELECT o FROM Ordine o WHERE o.chiuso = true AND o.evaso = false ORDER BY o.dataApertura DESC")})
@Table(name="ordini")
public class Ordine
{
  @Id
  @GeneratedValue(strategy=GenerationType.AUTO)
  @Column
  private Long id;
  @Column(nullable=false)
  private Date dataApertura;
  @Column
  private Date dataChiusura;
  @Column(nullable=false)
  private Boolean chiuso;
  @Column(nullable=false)
  private Boolean evaso;
  @Column
  private Double costoTotale;
  @ManyToOne(fetch=FetchType.EAGER)
  @JoinColumn(name="cliente_id")
  private Cliente cliente;
  @OneToMany(mappedBy="ordine", cascade = {CascadeType.REMOVE}, fetch=FetchType.EAGER)
  private List<RigaOrdine> righeOrdine;
  
  public Ordine() {}
  
  public Ordine(Cliente cliente, Date dataApertura, Boolean chiuso, Boolean evaso) {
    this.cliente = cliente;
    this.dataApertura = dataApertura;
    this.chiuso = chiuso;
    this.evaso = evaso;
    this.costoTotale = 0.00;
    this.righeOrdine = new ArrayList<RigaOrdine>();
  }
  
  public Long getId()
  {
    return this.id;
  }
  
  public void setId(Long id)
  {
    this.id = id;
  }
  

  public Date getDataApertura()
  {
    return this.dataApertura;
  }
  
  public void setDataApertura(Date dataApertura)
  {
    this.dataApertura = dataApertura;
  }
  
  public Date getDataChiusura()
  {
    return this.dataChiusura;
  }
  
  public void setDataChiusura(Date dataChiusura)
  {
    this.dataChiusura = dataChiusura;
  }
  
  public Boolean getChiuso()
  {
    return this.chiuso;
  }
  
  public void setChiuso(Boolean chiuso)
  {
    this.chiuso = chiuso;
  }
  
  public Boolean getEvaso()
  {
    return this.evaso;
  }
  
  public void setEvaso(Boolean evaso)
  {
    this.evaso = evaso;
  }
  
  
  
  public Double getCostoTotale() {
	return costoTotale;
}

public void setCostoTotale(Double costoTotale) {
	this.costoTotale = costoTotale;
}

public Cliente getCliente()
  {
    return this.cliente;
  }
  
  public void setCliente(Cliente cliente)
  {
    this.cliente = cliente;
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
	result = prime * result
			+ ((dataApertura == null) ? 0 : dataApertura.hashCode());
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
	Ordine other = (Ordine) obj;
	if (dataApertura == null) {
		if (other.dataApertura != null)
			return false;
	} else if (!dataApertura.equals(other.dataApertura))
		return false;
	if (id == null) {
		if (other.id != null)
			return false;
	} else if (!id.equals(other.id))
		return false;
	return true;
}


  
}
