package br.com.Licitacao.dao;

import br.com.Licitacao.conexao.ConnectionFactory;
import br.com.Licitacao.model.Item;
import br.com.Licitacao.model.Produto;

import java.sql.*;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ProdutoDAO {
	private ConnectionFactory dao = ConnectionFactory.getInstancia();
	
	private static ProdutoDAO instancia;
	
	protected ProdutoDAO() {
		
	}
	
	public static ProdutoDAO getInstancia() {
		if(instancia == null) {
			instancia = new ProdutoDAO();
		}
		return instancia;
	}

	
	public void adicionarProduto(Produto produto) throws SQLException, ClassNotFoundException {
		Connection con = dao.getConnection();
		PreparedStatement stmt = null;
		
		try {
			stmt = con.prepareStatement("insert into produto(nomeProd, descricaoPro, idMarca, idCat)" + 
					" values(?,?,?,?,?,?)");
			stmt.setString(1, produto.getNomeProduto());
			stmt.setString(2, produto.getDescricaoProduto());
			stmt.setInt(3, produto.getIdMarca());
			stmt.setString(4, produto.getCategoriaProduto().getNomeCategoria());
			
			stmt.execute();
			System.out.println("cadastrou novo produto");
			stmt.close();	
		}catch (SQLException e) {
			Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, e.getMessage());
		}finally {
			ConnectionFactory.closeConnection(con, stmt);
		}
	}
	
	public Vector<Produto> getLista(){
		Vector<Produto> produtos = new Vector<Produto>();
		Connection con = dao.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try{
			stmt = con.prepareStatement("SELECT * FROM produto");
			rs = stmt.executeQuery();
			while(rs.next()){
				Produto produto = new Produto();
				produto.setNomeProduto(rs.getString("nomeProduto"));
				produto.setIdProduto(rs.getInt("idproduto"));
				produto.setDescricaoProduto(rs.getString("descricao"));
				produtos.add(produto);
			}
		}catch (Exception e) {
			Logger.getLogger(SetorDAO.class.getName()).log(Level.SEVERE, null, e);
		}finally {
			ConnectionFactory.closeConnection(con, stmt, rs);
		}
		return produtos;
	}
	
	public Produto getProduto(int id){
		Connection con = dao.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
        	Produto produto = new Produto();
            stmt = con.prepareStatement("SELECT * FROM `produto` WHERE `idproduto` = "+id);
            rs = stmt.executeQuery();
            if (rs.next()) {
            	produto.setIdProduto(rs.getInt("idproduto"));
            	produto.setDescricaoProduto(rs.getString("descricao"));
            	produto.setNomeProduto(rs.getString("nomeProduto"));
            }
            return produto;
            }catch (Exception e) {
            	throw new RuntimeException(e);
			}finally {
				ConnectionFactory.closeConnection(con, stmt, rs);
			}
	}

}
