package it.ecommerce.controller;


import it.ecommerce.model.Ordine;
import it.ecommerce.model.Prodotto;
import it.ecommerce.model.RigaOrdine;
import it.ecommerce.model.RigaOrdineFacade;

import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class RigaOrdineController {

	@ManagedProperty(value="#{param.id}")
	private Long id;
	private Integer quantita;
	private Ordine ordine;
	private Prodotto prodotto;
	private RigaOrdine rigaOrdine;
	
	@EJB(beanName="roFacade")
	private RigaOrdineFacade rigaOrdineFacade;
	
	public RigaOrdineController() {}

	public boolean prodottoGiaInCarrello(Prodotto prodotto, Ordine ordine) {
		
		if(ordine == null) {
			return false;
		}
		
		else return this.rigaOrdineFacade.prodottoGiaInCarrello(prodotto, ordine);
		
	}
	
	public String createRigaOrdine(Prodotto prodotto, Ordine ordine) {
		
		this.rigaOrdine = this.rigaOrdineFacade.createRigaOrdine(prodotto, ordine, this.quantita);
		this.quantita = null;
		
		return "prodottoInserito";
	}
	
	public List<RigaOrdine> getRigheOrdineByProdotto(Prodotto prodotto) {
		
		List<RigaOrdine> righeOrdine = this.rigaOrdineFacade.getRigheOrdineByProdotto(prodotto);
		
		return righeOrdine;
	}
	
	public String getRigaOrdine(Long id) {
		
		this.quantita = null;
		this.rigaOrdine = this.rigaOrdineFacade.findRigaOrdine(id);
		
	
		return "modificaRigaOrdine";
				
	}
	
	public String modificaRigaOrdine(Long id) {
		
		this.rigaOrdine = this.rigaOrdineFacade.modificaRigaOrdine(id, this.quantita);
	
		return "rigaOrdineAggiornata";
				
	}
	
	public void rimuoviRigaOrdine(Long id, OrdineController ordineController, Long ordineId) {
		
		this.rigaOrdineFacade.rimuoviRigaOrdine(id);
		ordineController.findOrdine(ordineId);
		
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



	public RigaOrdine getRigaOrdine() {
		return rigaOrdine;
	}

	public void setRigaOrdine(RigaOrdine rigaOrdine) {
		this.rigaOrdine = rigaOrdine;
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

	public RigaOrdineFacade getRigaOrdineFacade() {
		return rigaOrdineFacade;
	}

	public void setRigaOrdineFacade(RigaOrdineFacade rigaOrdineFacade) {
		this.rigaOrdineFacade = rigaOrdineFacade;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((ordine == null) ? 0 : ordine.hashCode());
		result = prime * result
				+ ((prodotto == null) ? 0 : prodotto.hashCode());
		result = prime * result
				+ ((quantita == null) ? 0 : quantita.hashCode());
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
		RigaOrdineController other = (RigaOrdineController) obj;
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
		if (prodotto == null) {
			if (other.prodotto != null)
				return false;
		} else if (!prodotto.equals(other.prodotto))
			return false;
		if (quantita == null) {
			if (other.quantita != null)
				return false;
		} else if (!quantita.equals(other.quantita))
			return false;
		return true;
	}

	
	
	
}