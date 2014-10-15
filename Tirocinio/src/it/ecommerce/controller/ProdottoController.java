package it.ecommerce.controller;

import it.ecommerce.model.Fornitore;
import it.ecommerce.model.Prodotto;
import it.ecommerce.model.ProdottoFacade;
import it.ecommerce.model.RigaOrdine;

import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class ProdottoController
{
	@ManagedProperty("#{param.id}")
	private Long id;
	private String codice;
	private String nome;
	private Double costo;
	private Integer quantita;
	private String descrizione;
	private Prodotto prodotto;
	private List<Prodotto> prodotti;

	@EJB(beanName="pFacade")
	private ProdottoFacade prodottoFacade;

	public String createProdotto()
	{
		try {this.prodotto = this.prodottoFacade.createProdotto(this.codice, this.nome, this.costo, this.quantita, this.descrizione);
		}

		catch(Exception e) {
			return "erroreInserimentoProdotto";
		}

		this.codice = null;
		this.costo = null;
		this.descrizione = null;
		this.nome = null;
		this.quantita = null;
		return "prodottoInserito";
	}

	public String listaProdotti() {
		this.prodotti = prodottoFacade.getAllProdotti();
		return "prodotti"; 
	}


	public String findProdotto(Long id) {


		this.prodotto = this.prodottoFacade.getProdotto(id);

		return "prodotto";

	}

	//trova un prodotto e memorizza i dati nelle variabili del controller (cosi da essere visibili nella form di modifica)
	public String findProdottoDaAggiornare(Long id) {
		this.prodotto = this.prodottoFacade.getProdotto(id);
		this.codice = this.prodotto.getCodice();
		this.nome = this.prodotto.getNome();
		this.costo = this.prodotto.getCosto();
		this.descrizione = this.prodotto.getDescrizione();
		return "modificaProdotto";
	}

	//aggiorna il prodotto con i nuovi dati
	public String modificaProdotto(Prodotto prodotto) {

		this.prodotto = this.prodottoFacade.modificaProdotto(prodotto, codice, nome, costo, descrizione);
		this.codice = null;
		this.costo = null;
		this.descrizione = null;
		this.nome = null;
		this.quantita = null;
		return "prodottoModificato";
	}

	//trova il prodotto da rimuovere e reindirizza alla pagina di rimozione
	public String rimuoviProdotto(Prodotto prodotto) {

		this.prodotto = this.prodottoFacade.getProdotto(prodotto.getId());

		return "rimuoviProdotto";

	}

	//esegue la rimozione del prodotto
	public String confermaRimozioneProdotto(Prodotto prodotto, List<RigaOrdine> righeOrdine) {

		this.prodottoFacade.rimuoviProdotto(prodotto, righeOrdine);
		this.prodotti = prodottoFacade.getAllProdotti();
		this.prodotto = null;

		return "prodottoRimosso";
	}

	//reindirizza alla form di aggiunta del fornitore
	public String aggiungiFornitore() {

		return "aggiungiFornitore";

	}

	public String confermaInserimentoFornitore(Fornitore fornitore) {

		if(!this.prodotto.getFornitori().contains(fornitore)) {
			this.prodottoFacade.aggiungiFornitore(this.prodotto, fornitore);
			return "fornitoreAggiunto";
		}
		else {
			return "erroreInserimentoFornitore";
		}
	}

	//reindirizza alla pagina di rimozione del fornitore dalla lista di fornitori del prodotto
	public String rimuoviFornitoreDaProdotto() {

		return "rimuoviFornitoreDaProdotto";
	}

	//rimuove il fornitore dalla lista di fornitori del prodotto
	public String confermaRimozioneFornitoreDaProdotto(Fornitore fornitore) {

		if(this.prodotto.getFornitori().contains(fornitore)) {
			this.prodottoFacade.rimuoviFornitore(this.prodotto, fornitore);
			return "fornitoreEliminato";
		}else
			return "erroreRimozioneFornitore";
	}


	public Long getId()
	{
		return this.id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public String getCodice()
	{
		return this.codice;
	}

	public void setCodice(String codice)
	{
		this.codice = codice;
	}

	public String getNome()
	{
		return this.nome;
	}

	public void setNome(String nome)
	{
		this.nome = nome;
	}

	public Double getCosto()
	{
		return this.costo;
	}

	public void setCosto(Double costo)
	{
		this.costo = costo;
	}

	public Integer getQuantita()
	{
		return this.quantita;
	}

	public void setQuantita(Integer quantita)
	{
		this.quantita = quantita;
	}

	public String getDescrizione()
	{
		return this.descrizione;
	}

	public void setDescrizione(String descrizione)
	{
		this.descrizione = descrizione;
	}

	public Prodotto getProdotto()
	{
		return this.prodotto;
	}

	public void setProdotto(Prodotto prodotto)
	{
		this.prodotto = prodotto;
	}

	public List<Prodotto> getProdotti()
	{
		return this.prodotti;
	}

	public void setFornitori(List<Prodotto> prodotti)
	{
		this.prodotti = prodotti;
	}

	public ProdottoFacade getProdottoFacade()
	{
		return this.prodottoFacade;
	}

	public void setProdottoFacade(ProdottoFacade prodottoFacade)
	{
		this.prodottoFacade = prodottoFacade;
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((codice == null) ? 0 : codice.hashCode());
		result = prime * result + ((costo == null) ? 0 : costo.hashCode());
		result = prime * result
				+ ((descrizione == null) ? 0 : descrizione.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result + ((prodotti == null) ? 0 : prodotti.hashCode());
		result = prime * result + ((prodotto == null) ? 0 : prodotto.hashCode());
		result = prime * result
				+ ((prodottoFacade == null) ? 0 : prodottoFacade.hashCode());
		result = prime * result + ((quantita == null) ? 0 : quantita.hashCode());
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
		ProdottoController other = (ProdottoController) obj;
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
		if (descrizione == null) {
			if (other.descrizione != null)
				return false;
		} else if (!descrizione.equals(other.descrizione))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (prodotti == null) {
			if (other.prodotti != null)
				return false;
		} else if (!prodotti.equals(other.prodotti))
			return false;
		if (prodotto == null) {
			if (other.prodotto != null)
				return false;
		} else if (!prodotto.equals(other.prodotto))
			return false;
		if (prodottoFacade == null) {
			if (other.prodottoFacade != null)
				return false;
		} else if (!prodottoFacade.equals(other.prodottoFacade))
			return false;
		if (quantita == null) {
			if (other.quantita != null)
				return false;
		} else if (!quantita.equals(other.quantita))
			return false;
		return true;
	}



}
