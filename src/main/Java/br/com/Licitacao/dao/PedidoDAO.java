package br.com.Licitacao.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;


import br.com.Licitacao.conexao.ConnectionFactory;
import br.com.Licitacao.model.Item;
import br.com.Licitacao.model.Pedido;
import br.com.Licitacao.model.Setor;

public class PedidoDAO {
	private ConnectionFactory dao = ConnectionFactory.getInstancia();
	private static PedidoDAO instancia;
	
	protected PedidoDAO() {
		
	}
	
	public static PedidoDAO getInstancia() {
		if(instancia == null) {
			instancia = new PedidoDAO();
		}
		return instancia;
	}
	
	public void adicionarPedidoInterno (Pedido pedidoInterno) throws SQLException {
		Connection con = (Connection) dao.getConnection();
		PreparedStatement stmt = null;
		try {
			
			//AQUE EU VOU TER Q SALVAR NA TABELA SOMENTE O ID DO ITEM PEDIDO, O SETOR E A SITUAÇÃO.
			stmt = con.prepareStatement("SQL PARA INSERIR PEDIDO INTERNO");
			stmt.setInt(1, pedidoInterno.getItemPedido().getIdItem());
			stmt.setInt(2, pedidoInterno.getIdSetor().getIdSetor());
			stmt.setBoolean(3, pedidoInterno.isSituacao());
			
			stmt.execute();
			
		} catch (Exception e) {
			Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, e);
		}finally {
			ConnectionFactory.closeConnection(con, stmt);
		}
	/*INSERT INTO `item` (`idProduto`, `qtdProduto`)VALUES (1,3);
INSERT INTO `pedidoItem`(`idSetor`, `aprovado`, `idItem`) VALUES (1,false,1);*/
	}

	public Vector<Pedido> getLista(){
		Vector<Pedido> pedidos = new Vector<Pedido>();
		Connection con = dao.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try{
			stmt = con.prepareStatement("SELECT * FROM pedidoItem");
			rs = stmt.executeQuery();
			while(rs.next()){
				Pedido pedido = new Pedido();
				pedido.setIdPedido(rs.getInt("idPi"));
				pedido.setItemPedido(new Item().getItem(rs.getInt("idItem")));
				pedido.setIdSetor(new Setor().getSetor(rs.getInt("idSetor")));
				pedidos.add(pedido);
			}
		}catch (Exception e) {
			Logger.getLogger(SetorDAO.class.getName()).log(Level.SEVERE, null, e);
		}finally {
			ConnectionFactory.closeConnection(con, stmt, rs);
		}
		return pedidos;
	}
	
	/*public Pedido getPedido(int id){
		Connection con = dao.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
        	Pedido pedido = new Pedido();
            stmt = con.prepareStatement("SELECT `idPi`, `idSetor`, `aprovado`, `idItem` FROM `pedidoItem` WHERE `idPi`="+id);
            rs = stmt.executeQuery();
            if (rs.next()) {
            	pedido.setItemPedido();
            }
            return pedido;
            }catch (Exception e) {
            	throw new RuntimeException(e);
			}finally {
				dao.closeConnection(con, stmt, rs);
			}
	}*/
}