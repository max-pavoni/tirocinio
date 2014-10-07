package it.ecommerce.model;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

	@Stateless(name="roFacade")
	public class RigaOrdineFacade {
		@PersistenceContext(unitName="ecommerce-unit")
		private EntityManager em;
		
		public boolean prodottoGiaInCarrello(Prodotto prodotto, Ordine ordine) {

			
			try { em.createNamedQuery("trovaRigaOrdineByProdottoAndCliente", Ordine.class).setParameter("prodotto", prodotto).setParameter("ordine", ordine).getSingleResult();
			return true;
		}
		
			catch(NoResultException e) {
				return false;
			}
		}
		
		public RigaOrdine createRigaOrdine(Prodotto prodotto, Ordine ordine, Integer quantita) {
			for(RigaOrdine r : ordine.getRigheOrdine()){
				if (r.getProdotto().equals(prodotto)) {
					r.setQuantita(r.getQuantita()+quantita);
					r.setCostoTotale(r.getCostoTotale()+quantita*prodotto.getCosto());
					em.merge(r);
					return r;
				}
			}
			RigaOrdine riga = new RigaOrdine(prodotto, ordine, quantita);
			riga.getOrdine().setCostoTotale(riga.getOrdine().getCostoTotale() + riga.getCostoTotale());
			em.merge(riga);
			return riga;
		}
			

		public List<RigaOrdine> getRigheOrdineByProdotto(Prodotto prodotto) {
			List<RigaOrdine> righeOrdine;
			try {
				righeOrdine = em.createNamedQuery("trovaRigheOrdineByProdotto", RigaOrdine.class).setParameter("prodotto", prodotto).getResultList();
			}
			catch(NoResultException e) {
				righeOrdine =  null;
			}
			
			return righeOrdine;
		}
		
		public RigaOrdine findRigaOrdine(Long id) {
			
			RigaOrdine riga;
			riga = em.find(RigaOrdine.class, id);
			return riga;
			
		}
		
		public RigaOrdine modificaRigaOrdine(Long id, Integer quantita) {
			
			RigaOrdine riga = this.findRigaOrdine(id);
			riga.getOrdine().setCostoTotale(riga.getOrdine().getCostoTotale() - riga.getCostoTotale());
			riga.setQuantita(quantita);
			riga.setCostoTotale(riga.getProdotto().getCosto()*quantita);
			em.merge(riga);
			riga.getOrdine().setCostoTotale(riga.getOrdine().getCostoTotale() + riga.getCostoTotale());
			em.merge(riga.getOrdine());
			return riga;
			
		}
		
		public void rimuoviRigaOrdine(Long id) {
			RigaOrdine riga = em.find(RigaOrdine.class, id);
			em.remove(riga);
			riga.getOrdine().setCostoTotale(riga.getOrdine().getCostoTotale() - riga.getCostoTotale());
			em.merge(riga.getOrdine());
			
		}
		
}
