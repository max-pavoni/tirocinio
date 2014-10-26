package it.ecommerce.test;

import static org.junit.Assert.*;
import it.ecommerce.model.Prodotto;

import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;


public class ProdottoFacadeTest {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private static EntityTransaction tx;
	
	@BeforeClass
	public static void initEntityManager() throws Exception {
		
		emf = Persistence.createEntityManagerFactory("ecommerce-unit");
		em = emf.createEntityManager();
		
	}

	@AfterClass
	public static void closeEntityManager() throws SQLException {
		em.close();
		emf.close();
	}
	
	@Before
	public void initTransaction() {
		tx = em.getTransaction();
	}
	
	@Test
	public void createProdottoTest() {
		
		Prodotto p = new Prodotto("1234", "libro", 10.00, 50, "E' un libro.");
		tx.begin();
		em.persist(p);
		tx.commit();
		
		List<Prodotto> prodotti = em.createNamedQuery("trovaProdotti", Prodotto.class).getResultList();
		assertNotNull(prodotti);
		assertTrue(prodotti.contains(p));
		
	}
	

	/*
	@Test
	public void testGetAllProdotti() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetProdotto() {
		fail("Not yet implemented");
	}

	@Test
	public void testModificaProdotto() {
		fail("Not yet implemented");
	}

	@Test
	public void testRimuoviProdotto() {
		fail("Not yet implemented");
	}

	@Test
	public void testAggiungiFornitore() {
		fail("Not yet implemented");
	}

	@Test
	public void testRimuoviFornitore() {
		fail("Not yet implemented");
	}
*/
}
