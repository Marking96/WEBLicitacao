package br.com.Licitacao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.management.RuntimeErrorException;
import br.com.Licitacao.conexao.ConnectionFactory;
import br.com.Licitacao.model.Item;
import br.com.Licitacao.model.Pedido;
import br.com.Licitacao.model.Produto;

public class ItemDAO {
	private ConnectionFactory dao = ConnectionFactory.getInstancia();
	
	private static ItemDAO instancia;
	
	protected ItemDAO() {
		
	}
	
	public static ItemDAO getInstancia() {
		if(instancia == null) {
			instancia = new ItemDAO();
		}
		return instancia;
	}
	
	public void adicionarItem(Item item) throws SQLException, ClassNotFoundException{
		Connection con = dao.getConnection();
		PreparedStatement stmt = null;
		try {
			stmt = con.prepareStatement("INSTE INTO item(idProduto, descricao, quantidade) VALUES (?, ?, ?)");
			stmt.setInt(1, item.getIdProduto().getIdProduto());
			stmt.setInt(3, item.getQuantidade());
			stmt.execute();
			stmt.close();
			
		} catch (Exception e) {
			throw new RuntimeErrorException(null, e.getMessage() + "ItemDAO: erro em adicionar item");
		}
	}
	
	public Vector<Item> getLista(){
		Vector<Item> itens = new Vector<Item>();
		Connection con = dao.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try{
			stmt = con.prepareStatement("SELECT * FROM item");
			rs = stmt.executeQuery();
			while(rs.next()){
				Item item = new Item();
				
				
				itens.add(item);
			}
		}catch (Exception e) {
			Logger.getLogger(Item.class.getName()).log(Level.SEVERE, null, e);
		}finally {
			ConnectionFactory.closeConnection(con, stmt, rs);
		}
		return itens;
	}

	
	public Item getItem(int id){
		Connection con = dao.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            Item item = new Item();
            stmt = con.prepareStatement("SELECT * FROM item WHERE iditem ="+id);
            rs = stmt.executeQuery();
            if (rs.next()) {
            	item.setIdItem(rs.getInt("iditem"));
            	item.setIdProduto(new Produto().getProduto(rs.getInt("idProduto")));
            	item.setQuantidade(rs.getInt("qtdProduto"));
            }
            return item;
            }catch (Exception e) {
            	throw new RuntimeException(e);
			}finally {
				ConnectionFactory.closeConnection(con, stmt, rs);
			}
	}
}
