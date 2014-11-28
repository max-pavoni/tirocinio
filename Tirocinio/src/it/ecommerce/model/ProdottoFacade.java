package it.ecommerce.model;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless(name="pFacade")
public class ProdottoFacade
{
	@PersistenceContext(unitName="ecommerce-unit")
	private EntityManager em;

	public Prodotto createProdotto(String codice, String nome, Double costo, Integer quantita, String descrizione)
	{
		Prodotto prodotto = new Prodotto(codice, nome, costo, quantita, descrizione);
		this.em.persist(prodotto);
		return prodotto;
	}

	public List<Prodotto> getAllProdotti() {
		List<Prodotto> prodotti = em.createNamedQuery("trovaProdotti", Prodotto.class).getResultList();
		return prodotti;

	}

	public Prodotto getProdotto(Long id) {

		Prodotto prodotto;
		prodotto = em.find(Prodotto.class, id);
		return prodotto;
	}

	public Prodotto modificaProdotto(Prodotto prodotto, String codice,  String nome, Double costo, String descrizione) {

		prodotto.setCodice(codice);
		prodotto.setCosto(costo);
		prodotto.setNome(nome);
		prodotto.setDescrizione(descrizione);
		em.merge(prodotto);
		return prodotto;

	}

	public void rimuoviProdotto(Prodotto prodotto, List<RigaOrdine> righeOrdine){
		for(RigaOrdine r : righeOrdine) {
			r.getOrdine().setCostoTotale(r.getOrdine().getCostoTotale() - r.getCostoTotale());
			em.merge(r.getOrdine());
		}
		em.createNamedQuery("rimuoviProdottoById", Prodotto.class).setParameter("id", prodotto.getId()).executeUpdate();

	}

	public void aggiungiFornitore(Prodotto prodotto, Fornitore fornitore) {
		prodotto.getFornitori().add(fornitore);
		fornitore.getProdotti().add(prodotto);
		em.merge(prodotto);
		em.merge(fornitore);
	}

	public void rimuoviFornitore(Prodotto prodotto, Fornitore fornitore) {
		prodotto.getFornitori().remove(fornitore);
		Fornitore fornitore2 = em.find(Fornitore.class, fornitore.getId());
		fornitore2.getProdotti().remove(prodotto);
		em.merge(prodotto);
		em.merge(fornitore2);

	}

	public EntityManager getEm() {
		return em;
	}

	public void setEm(EntityManager em) {
		this.em = em;
	}
	
	

}


