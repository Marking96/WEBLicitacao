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
	 <script src="<c:url value="/assets/js/jquery-form.js"/>"></script>
</head>
    <body>
        <nav class="nav nav-aberta">
             <jsp:include page="/componets/menu.html"/>
        </nav>
        <div class="contentudo">
      
          <jsp:include page="/componets/header.html"/>
        
        <section>
            <div class="content">
            	<c:if test="${cadastrado}">
            	<div  id="id001" class="modal">
            		<h3>Funcionario Adicionado</h3>
            	</div>
            </c:if>
            	<div class="barra-op">
            		<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Nova Categoria</button>
            		<button onclick="document.getElementById('id02').style.display='block'" style="width:auto;">Cadastra Fornecedor</button>
            	</div>
            	
            	<%
            		Vector<Setor> cc  = (Vector)session.getAttribute("setores");
            	
            		for(int i = 0; i < cc.size();i++ ){
            	%>	<a id="content-box-link" href="/pedidos.jsp">
                		<h2><%=cc.get(i).getNomeSetor() %></h2>
                		<p><%=cc.get(i).qtdFuncionarioSetor(cc.get(i).getIdSetor())%> : Funcionarios</p>
                		<p>00: pedidos</p>
               </a> 
				<%} %>
            	
                <div id="id01" class="modal">
					  <jsp:include page="/componets/SetorForm.html"/>
				</div>
				
				<div id="id02" class="modal">
					  <jsp:include page="/componets/FuncionarioForm.jsp"/>
				</div>
            </div>
            <%!boolean cadastrado = false; %>
           
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