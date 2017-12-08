
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ page import="java.util.*, br.com.Licitacao.model.Funcionario" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<body>
		<%!Funcionario funcionarios = new Funcionario(); %>
		<%
			funcionarios.setNomeFuncionario(request.getParameter("Fnome"));
			funcionarios.getCpfFuncionario().setCpf(request.getParameter("Fcpf"));
			funcionarios.getContatoFuncionario().setEmail(request.getParameter("Femail"));
			funcionarios.getContatoFuncionario().setTelefone(request.getParameter("Ftele"));
			funcionarios.getContatoFuncionario().setCelular(request.getParameter("Cel"));
			funcionarios.getEnderecoFuncionario().setRua(request.getParameter("Frua"));
			funcionarios.setIdSetor(Integer.parseInt(request.getParameter("setor")));
			funcionarios.getLoginFuncionario().setLogin(request.getParameter("Flogin"));
			funcionarios.getLoginFuncionario().setSenha(request.getParameter("Fsenha"));

			funcionarios.cadastrarFuncionario(funcionarios);
		%>

	</body>
</html>