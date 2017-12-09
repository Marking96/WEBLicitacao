<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="java.util.*, br.com.Licitacao.model.*" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sistema de Licitações</title>
    <link rel="stylesheet" href="<c:url value="/assets/css/style.css"/>" media="screen">
    <link rel="stylesheet" href="<c:url value="/assets/css/responsivoStyle.css"/>" media="screen">
    <link href="<c:url value="/assets/css/material-Icons.css"/>" rel="stylesheet">
    <script src="<c:url value="/assets/js/jQuery.js"/>"></script>
</head>
    <body>
    <jsp:include page="/control/listaFControljsp.jsp"/>
        <nav class="nav nav-aberta">
             <jsp:include page="/componets/menu.jsp"/>
        </nav>
        <div class="contentudo">
      
          <jsp:include page="/componets/header.html"/>
        
        <section>
            <div class="content">
            	<div class="clear"></div>
	                <input type="text" id="filtro_tabela" placeholder="Buscar nesta lista" />
	
	                <table class="tb-licitacao" style="width:100%" id="tb1">
	                    <thead>
	                        <tr>
	                            <th width="20px">N°</th>
	                            <th width="300px">Fornecedor</th>
	                            <th width="100px">CNPJ</th>
	                            <th width="100px" >Nota</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        
	                    <%
		            		Vector<Fornecedor> cc  = (Vector)session.getAttribute("fornecedores");
		            	
		            		for(int i = 0; i < cc.size();i++ ){
            			%>
	                    <tr>
	                        <td><%=i %></td>
	                        <td><%=cc.get(i).getNomeFornecedor() %></td>
	                        <td><%=cc.get(i).getCnpjFornecedor().getCnpj() %></td>
	                        <td><%=cc.get(i).getNotaFornecedor() %></td>
	                    </tr>
	                    <%} %>
	                </tbody>
	                </table>
	                <br>
	                <div id="pageNav"></div>
            </div>
        </section>
       	<jsp:include page="/componets/footer.html"/>
</div>
        <script src="<c:url value="/assets/js/Scripts.js"/>"></script>
            
    </body>
</html>