package br.com.Licitacao.model;

import java.util.logging.Level;
import java.util.logging.Logger;

import br.com.Licitacao.dao.ItemDAO;

public class Item {
	private int idItem;
	private Produto idProduto;
	private int quantidade;
	
	private ItemDAO dao = ItemDAO.getInstancia();
	
	public Item() {
		
	}
	
	public void adicionarItem(Item item) {
		Item novoItem = new Item();
		try {
			/*novoItem.setIdProduto(item.getIdProduto());
			novoItem.setQuantidade(item.getQuantidade());*/
			
			// NESSA PARTE EU FAÇO UM PEDIDO DESTE ITEM
			Pedido pedido = new Pedido();
			pedido.adicionarPedidoInterno(item);
			
			
		} catch (Exception e) {
			Logger.getLogger(Item.class.getName()).log(Level.SEVERE, null, e);
		}
	}
	
	public Item getItem(int id){
		return dao.getItem(id);
	}

	public int getIdItem() { return idItem; }
	public void setIdItem(int idItem) {
		this.idItem = idItem;
	}
	public Produto getIdProduto() { return idProduto; }
	public void setIdProduto(Produto idProduto) {
		this.idProduto = idProduto;
	}
	public int getQuantidade() { return quantidade; }
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
}
	
	

}
