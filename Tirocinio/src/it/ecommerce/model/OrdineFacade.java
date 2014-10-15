package it.ecommerce.model;

import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

@Stateless(name="oFacade")
public class OrdineFacade
{
	@PersistenceContext(unitName="ecommerce-unit")
	private EntityManager em;

	public Ordine createOrdine(Cliente cliente){
		Date dataApertura = new Date();
		Ordine ordine = new Ordine(cliente, dataApertura, false, false);
		try {
			this.em.persist(ordine);
		}
		catch(Exception e) {
			return null;
		}
		return ordine;
	}

	//cerca un ordine aperto nella lista degli ordini del cliente: se non lo trova ne crea uno.
	public Ordine getOrdineAperto(Cliente cliente) {
		Ordine ordine;
		try { 
			ordine = em.createNamedQuery("trovaOrdineApertoByCliente", Ordine.class).setParameter("cliente", cliente).getSingleResult();
		}
		catch(NoResultException e) {
			ordine = new Ordine(cliente, new Date(), false, false);
			em.persist(ordine);
			return ordine;
		}

		return ordine;

	}

	public List<Ordine> getAllOrdiniByCliente(Cliente cliente) {

		List<Ordine> ordini;

		try {

			ordini = this.em.createNamedQuery("trovaOrdiniByCliente", Ordine.class).setParameter("cliente", cliente).getResultList();
			for(Ordine ordine : ordini) {
				double costo=0.0;
				for(RigaOrdine r : ordine.getRigheOrdine())
					costo += r.getCostoTotale();
				ordine.setCostoTotale(costo);
				em.merge(ordine);
			}
		}

		catch(NoResultException e) {
			return null;
		}

		return ordini;
	}

	public Ordine getOrdine(Long id) {

		Ordine ordine;
		ordine = em.find(Ordine.class, id);
		return ordine;
	}

	public List<Ordine> GetAllOrdiniDaEvadere() {

		List<Ordine> ordini;

		try {
			ordini = this.em.createNamedQuery("trovaOrdiniDaEvadere", Ordine.class).getResultList();
		}
		catch (NoResultException e) {
			ordini = null;
		}
		return ordini;
	}

	public void chiudiOrdine(Ordine ordine) {

		if(this.getOrdine(ordine.getId()).getChiuso())
			return;

		ordine.setChiuso(true);

		ordine.setDataChiusura(new Date());
		em.merge(ordine);

	}

	//verifica se un ordine ha i requisiti per essere evaso.
	public boolean ordineProntoPerEssereEvaso(Ordine ordine) {

		for(RigaOrdine r : ordine.getRigheOrdine()) {
			if(r.getQuantita() > r.getProdotto().getQuantita())
				return false;
		}

		return true;

	}


	public void evadiOrdine(Long id) {

		Ordine ordine = this.getOrdine(id);
		if(ordineProntoPerEssereEvaso(ordine)) {
			ordine.setEvaso(true);
			for(RigaOrdine r : ordine.getRigheOrdine()) {
				r.getProdotto().setQuantita(r.getProdotto().getQuantita()-r.getQuantita());
				em.merge(r.getProdotto());
			}
		}

	}

}
