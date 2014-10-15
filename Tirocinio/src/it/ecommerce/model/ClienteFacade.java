package it.ecommerce.model;


import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.ParameterExpression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

@Stateless(name="cFacade")
public class ClienteFacade {

	@PersistenceContext(unitName = "ecommerce-unit")
	private EntityManager em;

	public Cliente createCliente(String nome, String cognome, String codiceFiscale, String indirizzo, Date dataNascita,  String email, String password)  throws Exception  {

		Date dataRegistrazione = new Date();
		Cliente cliente = new Cliente(nome, cognome, codiceFiscale, indirizzo, dataNascita, dataRegistrazione, email, password);
		try {
			em.persist(cliente);
		}

		catch (Exception e) {
			cliente = null;
		}
		return cliente;
	}

	public Cliente autentica(String email, String password) {

		Cliente cliente = this.getCliente(email);

		if(cliente==null || !(cliente.getPassword().equals(password)))
			return null;
		else 
			return cliente;

	}

	public Cliente getCliente(String email){
		Cliente cliente;
		try {
			cliente = em.createNamedQuery("trovaCliente", Cliente.class).setParameter("email", email).getSingleResult();
		}
		catch (Exception e) {
			return null;
		}
		return cliente;
	}


}