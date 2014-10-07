package it.ecommerce.model;


import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless(name="fFacade")
public class FornitoreFacade
{
  @PersistenceContext(unitName="ecommerce-unit")
  private EntityManager em;
  
  public Fornitore createFornitore(String nome, String iva, String indirizzo, String mail, String telefono) {
	  Fornitore f = new Fornitore(nome, iva, indirizzo, mail, telefono);

			  em.persist(f);

	  return f;
  }
  
	public Fornitore findFornitoreByNome(String nome)  {
		Fornitore fornitore = null;
		try {
			fornitore = (Fornitore)em.createNamedQuery("trovaFornitoreByNome", Fornitore.class).setParameter("nome", nome).getSingleResult();
		}
		catch(NoResultException e) {
			return fornitore;
		}
		return fornitore;
	}
	
	public void eliminaFornitore(Fornitore fornitore) {
		em.remove(fornitore);
	}
}
  