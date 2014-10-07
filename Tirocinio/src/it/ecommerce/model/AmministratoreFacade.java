package it.ecommerce.model;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless(name="amministratoreFacade")
public class AmministratoreFacade {

	@PersistenceContext(unitName = "ecommerce-unit")
	private EntityManager em;

	
	public Amministratore createAmministratore(String nome, String cognome, String pin, String password) throws Exception {
		try {
			Amministratore amministratore = new Amministratore(nome, cognome, pin, password);
			em.persist(amministratore);
			return amministratore;
		}
		catch(Exception e) {
			return null;
		}
	}

	public List<Amministratore> getAllAmministratori(){
		Query q=em.createNamedQuery("findAll");
		List<Amministratore> admins =q.getResultList();
		return admins;
	}

	/**
	 * ritorna, se esiste, l'amministratore che corrisponde alla coppia pin-password indicata.
	 * Ritorna null se non trova una corrispondenza.
	 * @param pin
	 * @param password
	 * @return
	 */
	public Amministratore autentica(String pin, String password){
		Amministratore amministratore = findAdminByPin(pin);
		if(amministratore==null )
			return null;
		else if(amministratore.getPassword().equals(password))
			return amministratore;
		else
			return null;
	}
	
	/**
	 * cerca con una query nel DB l'amministratore corrispondente al pin passato come parametro.
	 * Se non lo trova ritorna null.
	 * @param pin
	 * @return
	 */
	public Amministratore findAdminByPin(String pin)  {
		Query trovaAmministratore = em.createNamedQuery("findAdminByPin");
		trovaAmministratore.setParameter("pin", pin);
		Amministratore amministratore;
		try {
		amministratore = (Amministratore)trovaAmministratore.getSingleResult();
		}
		catch (Exception e) {
			amministratore = null;
		}
		return amministratore;
	}

}
