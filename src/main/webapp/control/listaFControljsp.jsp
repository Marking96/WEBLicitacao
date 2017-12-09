<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="java.util.*, br.com.Licitacao.model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<body>
	<%
	Fornecedor fornecedor = new Fornecedor();
	Vector<Fornecedor> fornecedores;
	fornecedores = fornecedor.fornecedoresRecursados();
	session.setAttribute("fornecedores", new Fornecedor().fornecedoresPorCategoria(Integer.parseInt(request.getParameter("idCat"))));
	
	%>
</body>
</html>