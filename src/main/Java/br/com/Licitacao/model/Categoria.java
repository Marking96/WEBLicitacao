package br.com.Licitacao.model;

import java.util.Vector;

import br.com.Licitacao.dao.CategoriaDAO;

public class Categoria {
	private int idCategoria;
	private String nomeCategoria;
	
	private CategoriaDAO catDAO = CategoriaDAO.getInstancia();
	public Categoria() {
		
	}
	
	
	public void adicionarCategoria(Categoria addCategoria) {
		try {
			Categoria novaCategoria = new Categoria();
			novaCategoria.setIdCategoria(addCategoria.getIdCategoria());
			novaCategoria.setNomeCategoria(addCategoria.getNomeCategoria());
			catDAO.addCategoria(novaCategoria);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	public void removerCategoria(int idCategoria) {
		
	}
	
	public void editarCategoria(int idCategoria) {
		
	}
	
	public Vector<Categoria> listaCategorias(){
		return catDAO.listar();
	}
	
	
	// metodos getters e setters
		public int getIdCategoria() { return idCategoria; }
		public void setIdCategoria(int idCategoria) {
			this.idCategoria = idCategoria;
		}
		public String getNomeCategoria() { return nomeCategoria; }
		public void setNomeCategoria(String nomeCategoria) {
			this.nomeCategoria = nomeCategoria;
		}
		
	
	

}
