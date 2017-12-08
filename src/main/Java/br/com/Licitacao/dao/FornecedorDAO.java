package br.com.Licitacao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

import br.com.Licitacao.conexao.ConnectionFactory;
import br.com.Licitacao.model.Fornecedor;
import br.com.Licitacao.model.Setor;

public class FornecedorDAO {
	private ConnectionFactory dao = ConnectionFactory.getInstancia();
	
	private static FornecedorDAO instancia; 
	
	protected FornecedorDAO() {
		
	}
	
	public static FornecedorDAO getInstancia() {
		if (instancia == null) {
			instancia = new FornecedorDAO();
		}
		return instancia;
	}

	
	public void adicionaFornecedor(Fornecedor fornecedor) throws SQLException, ClassNotFoundException {
		Connection con = dao.getConnection();
		PreparedStatement stmt = null;
	
		try {
			stmt = con.prepareStatement("INSERT INTO fornecedor (nomeForn, cnpj, aprovado, nota, idCat) VALUES (?,?,?,?,?)");
			stmt.setString(1, fornecedor.getNomeFornecedor());
			stmt.setString(2, fornecedor.getCnpjFornecedor().getCnpj());
			//stmt.setString(3, fornecedor.getContatoFornecedor().getEmail());
			//stmt.setString(4, fornecedor.getContatoFornecedor().getTelefone());
			//stmt.setString(5, fornecedor.getContatoFornecedor().getCelular());
			//stmt.setString(6, fornecedor.getEndFornecedor().getRua());
			//stmt.setInt(7, fornecedor.getEndFornecedor().getNumero());
			//stmt.setString(8, fornecedor.getEndFornecedor().getBairro());
			//stmt.setString(9, fornecedor.getEndFornecedor().getBloco());
			//stmt.setString(10, fornecedor.getEndFornecedor().getCidade());
			//stmt.setString(11, fornecedor.getEndFornecedor().getEstado());
			//stmt.setString(12, fornecedor.getEndFornecedor().getCep());
			//stmt.setString(3, fornecedor.getLoginFornecedor().getLogin());
			//stmt.setString(4, fornecedor.getLoginFornecedor().getSenha());
			stmt.setBoolean(3, fornecedor.getAprovadoFornecedor());
			stmt.setFloat(4, fornecedor.getNotaFornecedor());
			stmt.setInt(5, fornecedor.getCategoriaFornecedor().getIdCategoria());
			
			stmt.executeUpdate();
		} catch (SQLException e) {
			Logger.getLogger(FornecedorDAO.class.getName()).log(Level.SEVERE, null, e);
		}finally {
			ConnectionFactory.closeConnection(con, stmt);
		}
	}
	
	public Vector<Fornecedor> getLista(){
		Vector<Fornecedor> fornecidores = new Vector();
		Connection con = dao.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try{
			stmt = con.prepareStatement("SELECT * FROM fornecedor" );
			rs = stmt.executeQuery();
			while(rs.next()){
				Fornecedor fornecedo = new Fornecedor();
				fornecedo.setNomeFornecedor(rs.getString("nomeForn"));
				fornecedo.setIdFornecedor(rs.getInt("idForn"));
				fornecedo.setAprovadoFornecedor(rs.getBoolean("aprovado"));
				fornecedo.getCnpjFornecedor().setCnpj(rs.getString("cnpj"));
				fornecedo.getCategoriaFornecedor().setIdCategoria(rs.getInt("idCat"));
				
				
				fornecidores.add(fornecedo);
			}
		}catch (Exception e) {
			Logger.getLogger(SetorDAO.class.getName()).log(Level.SEVERE, null, e);
		}finally {
			ConnectionFactory.closeConnection(con, stmt, rs);
		}
		return fornecidores;
	}
}
