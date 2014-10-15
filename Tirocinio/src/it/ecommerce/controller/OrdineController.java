package it.ecommerce.controller;

import it.ecommerce.model.Cliente;
import it.ecommerce.model.Ordine;
import it.ecommerce.model.OrdineFacade;

import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class OrdineController {

	@ManagedProperty(value="#{param.id}")
	private Long id;
	private String codice;
	private Date dataApertura;
	private Date dataChiusura;
	private Long costo;
	private Boolean chiuso;
	private Boolean evaso;
	private Ordine ordine;
	private List<Ordine> ordini;

	@EJB(beanName="oFacade")
	private OrdineFacade ordineFacade;

	public OrdineController() {}

	public String createOrdine(Cliente cliente) {
		this.ordine = this.ordineFacade.createOrdine(cliente);
		return "catalogoCliente";
	}

	//restituisce un ordine aperto se esiste, altrimenti ne crea uno nuovo.
	public Ordine getOrdineAperto(Cliente cliente) {

		this.ordine = this.ordineFacade.getOrdineAperto(cliente);

		return this.ordine;

	}

	public String listaOrdini(Cliente cliente) {

		this.ordini = this.ordineFacade.getAllOrdiniByCliente(cliente);

		return "listaOrdini";
	}

	public String findOrdine(Long id) {

		this.ordine = this.ordineFacade.getOrdine(id);

		return "ordine";
	}

	public String chiudiOrdine(Ordine ordine) {

		this.ordineFacade.chiudiOrdine(ordine);

		return "ordineChiuso";


	}

	public String listaOrdiniDaEvadere() {

		this.ordini = this.ordineFacade.GetAllOrdiniDaEvadere();

		return "listaOrdiniDaEvadere";

	}

	public String evadiOrdine(Long id) {

		this.ordineFacade.evadiOrdine(id);
		return "ordineEvaso";


	}

	//verifica se un ordine ha i requisiti per essere evaso
	public Boolean ordineProntoPerEssereEvaso(Ordine ordine) {
		return this.ordineFacade.ordineProntoPerEssereEvaso(ordine);
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCodice() {
		return codice;
	}

	public void setCodice(String codice) {
		this.codice = codice;
	}

	public Date getDataApertura() {
		return dataApertura;
	}

	public void setDataApertura(Date dataApertura) {
		this.dataApertura = dataApertura;
	}

	public Date getDataChiusura() {
		return dataChiusura;
	}

	public void setDataChiusura(Date dataChiusura) {
		this.dataChiusura = dataChiusura;
	}

	public Long getCosto() {
		return costo;
	}

	public void setCosto(Long costo) {
		this.costo = costo;
	}

	public Boolean getChiuso() {
		return chiuso;
	}

	public void setChiuso(Boolean chiuso) {
		this.chiuso = chiuso;
	}

	public Boolean getEvaso() {
		return evaso;
	}

	public void setEvaso(Boolean evaso) {
		this.evaso = evaso;
	}

	public Ordine getOrdine() {
		return ordine;
	}

	public void setOrdine(Ordine ordine) {
		this.ordine = ordine;
	}

	public List<Ordine> getOrdini() {
		return ordini;
	}

	public void setOrdini(List<Ordine> ordini) {
		this.ordini = ordini;
	}

	public OrdineFacade getOrdineFacade() {
		return ordineFacade;
	}

	public void setOrdineFacade(OrdineFacade ordineFacade) {
		this.ordineFacade = ordineFacade;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((chiuso == null) ? 0 : chiuso.hashCode());
		result = prime * result + ((codice == null) ? 0 : codice.hashCode());
		result = prime * result + ((costo == null) ? 0 : costo.hashCode());
		result = prime * result
				+ ((dataApertura == null) ? 0 : dataApertura.hashCode());
		result = prime * result
				+ ((dataChiusura == null) ? 0 : dataChiusura.hashCode());
		result = prime * result + ((evaso == null) ? 0 : evaso.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((ordine == null) ? 0 : ordine.hashCode());
		result = prime * result + ((ordini == null) ? 0 : ordini.hashCode());
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
		OrdineController other = (OrdineController) obj;
		if (chiuso == null) {
			if (other.chiuso != null)
				return false;
		} else if (!chiuso.equals(other.chiuso))
			return false;
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
		if (dataApertura == null) {
			if (other.dataApertura != null)
				return false;
		} else if (!dataApertura.equals(other.dataApertura))
			return false;
		if (dataChiusura == null) {
			if (other.dataChiusura != null)
				return false;
		} else if (!dataChiusura.equals(other.dataChiusura))
			return false;
		if (evaso == null) {
			if (other.evaso != null)
				return false;
		} else if (!evaso.equals(other.evaso))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (ordine == null) {
			if (other.ordine != null)
				return false;
		} else if (!ordine.equals(other.ordine))
			return false;
		if (ordini == null) {
			if (other.ordini != null)
				return false;
		} else if (!ordini.equals(other.ordini))
			return false;
		return true;
	}



}
