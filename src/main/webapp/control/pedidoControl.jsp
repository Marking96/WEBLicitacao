<%@page import="br.com.Licitacao.model.Item"%>
<%@page import="br.com.Licitacao.model.Produto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ page import="java.util.*, br.com.Licitacao.model.Funcionario" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%! Item item = new Item(); %>
	<%
		item.getIdProduto().setIdProduto(Integer.parseInt(request.getParameter("pedido")));
		item.setQuantidade(Integer.parseInt(request.getParameter("qtdPro")));
		
		item.adicionarItem(item);
	%>
</body>
</html>