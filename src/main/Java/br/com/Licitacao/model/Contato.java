package br.com.Licitacao.model;

public class Contato {
	private String email;
	private String telefone;
	private String celular;
	
	public Contato(String email, String telefone, String celular) {
		this.email = email;
		this.telefone = telefone;
		this.celular = celular;
	}
	
	public Contato() {
		
	}

	//metodos getters setters
	public String getEmail() { return email; }
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefone() { return telefone; }
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getCelular() { return celular; }
	public void setCelular(String celular) {
		this.celular = celular;
	}
	
}
