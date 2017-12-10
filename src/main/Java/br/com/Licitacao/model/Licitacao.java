package br.com.Licitacao.model;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Date;

import br.com.Licitacao.dao.LicitacaoDAO;

public class Licitacao {
	private int idLicitacao;
	private Item item= new Item();
	private String descricao;
	private Categoria catLicitacao = new Categoria();
	private LocalDate dataInicio;
	private LocalDate dataTermino;
	private float precoMedio;
	private boolean pendente;
	
	public LicitacaoDAO dao = LicitacaoDAO.getInstancia();
	public Licitacao() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public void adicionarLicitacao(Licitacao licitacao) throws SQLException{
		dao.adicionarLicitacao(licitacao);
	}
	
	
	
	public int getIdLicitacao() {
		return idLicitacao;
	}
	public void setIdLicitacao(int idLicitacao) {
		this.idLicitacao = idLicitacao;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Categoria getCatLicitacao() {
		return catLicitacao;
	}
	public void setCatLicitacao(Categoria catLicitacao) {
		this.catLicitacao = catLicitacao;
	}
	public LocalDate getDataInicio() {
		return dataInicio;
	}
	public void setDataInicio(LocalDate dataInicio) {
		this.dataInicio = dataInicio;
	}
	public LocalDate getDataTermino() {
		return dataTermino;
	}
	public void setDataTermino(LocalDate dataTermino) {
		this.dataTermino = dataTermino;
	}
	public float getPrecoMedio() {
		return precoMedio;
	}
	public void setPrecoMedio(float precoMedio) {
		this.precoMedio = precoMedio;
	}
	public boolean isPendente() {
		return pendente;
	}
	public void setPendente(boolean pendente) {
		this.pendente = pendente;
	}
	
	

}
