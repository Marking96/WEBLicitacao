<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="java.util.*, br.com.Licitacao.model.*" %>
    
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%
		Categoria categoria = new Categoria();
		Vector<Categoria> categorias;
		categorias = categoria.listaCategorias();
		session.setAttribute("categoria", new Categoria().listaCategorias());
		
		Fornecedor fornecedor = new Fornecedor();
		Vector<Fornecedor> fornecedores;
		fornecedores = fornecedor.fornecedoresRecursados();
		session.setAttribute("pendente", new Fornecedor().fornecedoresRecursados());
		
	%>
</body>
</html>