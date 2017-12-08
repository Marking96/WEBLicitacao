package br.com.Licitacao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import br.com.Licitacao.conexao.ConnectionFactory;
import br.com.Licitacao.model.Funcionario;

public class FuncionarioDAO {
	
	private ConnectionFactory dao = ConnectionFactory.getInstancia();
	
	private static FuncionarioDAO instancia; 
	
	protected FuncionarioDAO() {
		
	}
	
	public static FuncionarioDAO getInstancia() {
		System.out.println("esta em get instacia dao");
		if (instancia == null) {
			System.out.println("Aqui AQui");
			instancia = new FuncionarioDAO();
			System.out.println("1");
		}
		return instancia;
	}

	
	public synchronized void adicionaFuncionario(Funcionario funcionario) throws SQLException {
		System.out.println("esta em adicionar funcionario");
		Connection con = dao.getConnection();
		System.out.println("conection");
		PreparedStatement stmt = null;
	
		try {
			System.out.println("Entrou em dao");
			stmt = con.prepareStatement("insert into funcionario (nomeFunc, cpf, rua, bairro, email, telefone, celular, login, senha, idsetor) values (?,?,?,?,?,?,?,?,?,?)");
			stmt.setString(1, funcionario.getNomeFuncionario());
			stmt.setString(2, funcionario.getCpfFuncionario().getCpf());
			stmt.setString(3, funcionario.getEnderecoFuncionario().getRua());
			stmt.setString(4, funcionario.getEnderecoFuncionario().getBairro());
			stmt.setString(5, funcionario.getContatoFuncionario().getEmail());
			stmt.setString(6, funcionario.getContatoFuncionario().getTelefone());
			stmt.setString(7, funcionario.getContatoFuncionario().getCelular());
			stmt.setString(8, funcionario.getLoginFuncionario().getLogin());
			stmt.setString(9, funcionario.getLoginFuncionario().getSenha());
			stmt.setInt(10, funcionario.getIdSetor());
			System.out.println("tentando salva");
			stmt.executeUpdate();
			System.out.println("SAlvo");
		} catch (SQLException e) {
			System.out.println("Erro, em Adicionar DAO");
			Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, e);
			
		}finally {
			ConnectionFactory.closeConnection(con, stmt);
		}
	}
	
	public Funcionario retornarId (Funcionario func) throws  SQLException {
		Connection con = dao.getConnection(); 
		PreparedStatement stmt = null;
		ResultSet rs =null;
		try {
			Funcionario n = new Funcionario();
			
			stmt = con.prepareStatement("SELECT idFunc FROM funcionario WHERE cpf = '"+func.getCpfFuncionario().getCpf()+"'");
			rs = stmt.executeQuery();
			
			if(rs.next()){
				n.setIdFuncionario(rs.getInt("idFunc"));
			}
			
			return n;
			
		
		}  catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		}finally {
			ConnectionFactory.closeConnection(con, stmt,rs);
		}
	}
	
	public void excluirFuncionario(Funcionario funcionario) {
		
		Connection con = dao.getConnection();
		PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement("delete from funcionario where id=?");
            stmt.setInt(1, funcionario.getIdFuncionario());
            stmt.executeUpdate();
        } catch (SQLException e) {
        	throw new RuntimeException(e + " Erro ao tentar excluir");
        }finally {
			ConnectionFactory.closeConnection(con, stmt);
		}
	}
	
	public List<Funcionario> getLista(){
		List<Funcionario> funcionarios = new ArrayList<Funcionario>();
		Connection con = dao.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs =null;
		try {
			stmt= con.prepareStatement("Sql Aqui");
			rs = stmt.executeQuery();
			while(rs.next()) {
				Funcionario funcionario = new Funcionario();
				funcionario.setNomeFuncionario(rs.getString("nomeFunc"));                   
				funcionario.getContatoFuncionario().setCelular(rs.getString("celular"));
				funcionario.getContatoFuncionario().setEmail(rs.getString("email "));
				funcionario.getContatoFuncionario().setTelefone(rs.getString("telefone"));
				funcionario.getCpfFuncionario().setCpf(rs.getString("cpf"));    
				funcionario.getEnderecoFuncionario().setBairro(rs.getString("bairro "));    
				funcionario.getEnderecoFuncionario().setBloco(rs.getString("bloco "));      
				funcionario.getEnderecoFuncionario().setCep(rs.getString("cep"));     
				funcionario.getEnderecoFuncionario().setCidade(rs.getString("cidade")); 
				funcionario.getEnderecoFuncionario().setEstado(rs.getString("estado"));        
				funcionario.getEnderecoFuncionario().setNumero(rs.getInt("numero"));           
				funcionario.getEnderecoFuncionario().setRua(rs.getString("rua"));   
				funcionario.getLoginFuncionario().setLogin(rs.getString("login"));        
				funcionario.getLoginFuncionario().setSenha(rs.getString("senha"));          
				//
				
				funcionarios.add(funcionario);
			}
			
			
		} catch(SQLException e) {
			Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, e);
		}finally {
			ConnectionFactory.closeConnection(con, stmt, rs);
		}
		return funcionarios;
	}
	
	
	
}
