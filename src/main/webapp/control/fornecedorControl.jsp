<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="java.util.*, br.com.Licitacao.model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%
		Fornecedor fornecedor = new Fornecedor();
		fornecedor.setNomeFornecedor(request.getParameter("f-nome"));
		fornecedor.getCnpjFornecedor().setCnpj(request.getParameter("f-cnpj"));
		fornecedor.getLoginFornecedor().setLogin(request.getParameter("f-login"));
		fornecedor.getLoginFornecedor().setSenha(request.getParameter("f-senha"));
		fornecedor.getCategoriaFornecedor().setIdCategoria(Integer.parseInt(request.getParameter("f-categoria")));
		
		fornecedor.cadastrarFornecedor(fornecedor);
		
		
	%>
</body>
</html>