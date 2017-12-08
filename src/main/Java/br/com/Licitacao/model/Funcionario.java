package br.com.Licitacao.model;

import java.io.Serializable;
import java.sql.SQLException;

import br.com.Licitacao.dao.FuncionarioDAO;

public class Funcionario implements Serializable {
	
	private static final long serialVersionUID = 8982198782797245834L;
	private Integer idFuncionario;
	private String nomeFuncionario;
	private CPF cpfFuncionario = new CPF();
	private Contato contatoFuncionario = new Contato();
	private Endereco enderecoFuncionario = new Endereco();
	private Login loginFuncionario = new Login(); 
	private Integer idSetor;
	private int nivel = 1; 
	
	private FuncionarioDAO dao = FuncionarioDAO.getInstancia();
	
	
	public Funcionario() {
		
	}
	
	public synchronized void cadastrarFuncionario(Funcionario funci) {
		System.out.println("entrou em funcionario cadastrar");
		Funcionario cadFunc = new Funcionario();
		try {
			System.out.println("entro no try");
			System.out.println(funci.getIdSetor());
			System.out.println("aqui");

			System.out.println("cadastrar: vai entrar em fundionario dao");
			dao.adicionaFuncionario(funci);
			System.out.println("Funcionario: passou por dao");
			
			/*//retorna o id do usuario
			Funcionario fresult = new Funcionario();
			System.out.println("Erro n�o � akiS");
			FuncionarioDAO fun = FuncionarioDAO.getInstancia();
			fresult = fun.retornarId(cadFunc);
			System.out.println("resultado " + fresult.getIdFuncionario());
			
			
			//esse trecho de codigo insere na tabela com todos os outros logins
			Validacao validarNovo = new Validacao();
			validarNovo.setLogin(cadFunc.getLoginFuncionario().getLogin());
			validarNovo.setNivel(nivel);
			validarNovo.setIdCliente(fresult.getIdFuncionario());
			validarNovo.inserirAcesso(validarNovo);*/
			
		}catch (SQLException erro){
			System.out.println(erro.getStackTrace() + "erro em funcionario");
		}
		
		
	}
	
	
	
	/*public void excluirFuncionario(int idFunc) {
		try {
			Funcionario funcionario = new Funcionario();
			funcionario.setIdFuncionario(idFunc);
			FuncionarioDAO fun = new FuncionarioDAO();
			fun.excluirFuncionario(funcionario);
			System.out.println("passou por excluir");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}*/
	
	//metodos getters e setters
		public Integer getIdFuncionario() { return idFuncionario; }
		public void setIdFuncionario(Integer idFuncionario) { this.idFuncionario = idFuncionario; }
		public String getNomeFuncionario() { return nomeFuncionario; }
		public void setNomeFuncionario(String nome) { this.nomeFuncionario = nome; }
		public CPF getCpfFuncionario() { return cpfFuncionario; }
		public void setCpfFuncionario(CPF cpf) { this.cpfFuncionario = cpf; }
		public Contato getContatoFuncionario() { return contatoFuncionario; }
		public void setContatoFuncionario(Contato contato) { this.contatoFuncionario = contato; }
		public Endereco getEnderecoFuncionario() { return enderecoFuncionario; }
		public void setEnderecoFuncionario(Endereco endereco) { this.enderecoFuncionario = endereco; }
		public Login getLoginFuncionario() { return loginFuncionario; }
		public void setLoginFuncionario(Login login) { this.loginFuncionario = login; }

		public Integer getIdSetor() {return idSetor; }

		public void setIdSetor(Integer idSetor){ this.idSetor = idSetor; }
		
	

}
