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
    <jsp:include page="/control/loginControl.jsp"/>
    <jsp:include page="/control/Lpedidocontrol.jsp"/>
        <nav class="nav nav-aberta">
             <jsp:include page="/Funcionario/componets/menu.jsp"/>
        </nav>
        <div class="contentudo">
      
          <jsp:include page="/componets/header.html"/>
        
        <section>
            <div class="content">
            	<div class="barra-op">
            		<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Novo Setor</button>
            		<button onclick="document.getElementById('id02').style.display='block'" style="width:auto;">Cadastra Funcionario</button>
            	</div>
            	<div class="clear"></div>
	                <input type="text" id="filtro_tabela" placeholder="Buscar nesta lista" />
	
	                <table class="tb-licitacao" style="width:100%" id="tb1">
	                    <thead>
	                        <tr>
	                            <th>N°</th>
	                            <th width="300px">Produto</th>
	                            <th width="100px">Setor</th>
	                            <th width="100px" >Quantidade</th>
	                            <th>Descrição</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                  <%
		            		Vector<Pedido> cc  = (Vector)session.getAttribute("pedidos");
		            	
		            		for(int i = 0; i < cc.size();i++ ){
            			%>
	                    <tr>
	                        <td><%=i %></td>
	                        <td><%=cc.get(i).getItemPedido().getIdProduto().getNomeProduto() %></td>
	                        <td><%=cc.get(i).getIdSetor().getNomeSetor() %></td>
	                        <td><%=cc.get(i).getItemPedido().getQuantidade()%></td>
	                        <td><%=cc.get(i).getItemPedido().getIdProduto().getDescricaoProduto() %></td>
	                    </tr>
	                    <%} %>
	                </tbody>
	                </table>
	                <br>
	                <div id="pageNav"></div>
	                
	               <div id="id01" class="modal">
					  <jsp:include page="/componets/SetorForm.html"/>
				</div>
				
				<div id="id02" class="modal">
					  <jsp:include page="/componets/pedidoForm.jsp"/>
				</div>
            </div>
        </section>
       	<jsp:include page="/componets/footer.html"/>
</div>
        <script src="<c:url value="/assets/js/Scripts.js"/>"></script>
        <script>
			// Get the modal
			var modal = document.getElementById('id01');
			
			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
			    if (event.target == modal) {
			        modal.style.display = "none";
			    }
			}
			
			var modal2 = document.getElementById('id02');
			
			//When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
			 if (event.target == modal2) {
				 modal2.style.display = "none";
			 }
			}
		</script>
    </body>
</html>