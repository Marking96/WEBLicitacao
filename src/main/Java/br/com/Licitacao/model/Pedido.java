package br.com.Licitacao.model;

import java.util.Vector;

import br.com.Licitacao.dao.PedidoDAO;

public class Pedido {
	private int idPedido;
	private Item itemPedido;
	private boolean situacao = false;
	private Setor idSetor;
	
	private PedidoDAO dao = PedidoDAO.getInstancia();
	
	public Pedido() {
		
	}
	
	Pedido(Item item, Setor idSetor) {
		this.itemPedido = item;
		this.idSetor = idSetor;
	}
	
	public void adicionarPedidoInterno(Item pedidoInterno) {
		//AQUI EU RECEBO O ITEM QUE ESCOLHI E TENHO AGORA QUE DIZER A SITUAÇÃO SE 
		//ESTÁ APROVADO OU NAO E DIZER O SETOR... ESSA PARTE DA PRA ENVIAR A PARTIR DA VIEW???
		Pedido novoPedido = new Pedido(pedidoInterno, idSetor);
		try {
			dao.adicionarPedidoInterno(novoPedido);
		} catch (Exception e) {
			System.out.println(e + "erro Pedido: adicionar pedido interno");
		}
		
	}
	
	public Vector<Pedido> pedidos(){
		return dao.getLista();
	}
	
	public Vector<Pedido> pedidosPorSetor(int id){
		return dao.pedidosPorSetor(id);
	}
	
	public Pedido pedidoporID(int id){
		return dao.pedidosPorid(id);
	}
	//metodos getters e setters
	
	public Item getItemPedido() { return itemPedido; }
	public void setItemPedido(Item itemPedido) {
		this.itemPedido = itemPedido;
	}
	public boolean isSituacao() { return situacao; }
	public void setSituacao(boolean situacao) {
		this.situacao = situacao;
	}
	public Setor getIdSetor() { return idSetor; }
	public void setIdSetor(Setor idSetor) {
		this.idSetor = idSetor;
	}
	public int getIdPedido() {	return idPedido;}
	public void setIdPedido(int idPedido) {
		this.idPedido = idPedido;
	}
	
	

}

