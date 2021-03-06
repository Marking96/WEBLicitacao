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
    	<jsp:include page="/control/loginControl.jsp"/>
        <nav class="nav nav-aberta">
             <jsp:include page="/componets/menu.jsp"/>
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
            		Vector<Categoria> cc  = (Vector)session.getAttribute("categoria");
            	
            		for(int i = 0; i < cc.size();i++ ){
            	%>	<a id="content-box-link" href="listaFornecedores.jsp?idCat=<%=cc.get(i).getIdCategoria()%>">
                		<h2><%=cc.get(i).getNomeCategoria() %></h2>
                		<p><%=cc.get(i).qtdFornecedor(cc.get(i).getIdCategoria())%> : Fornecedores</p>
                		
               </a> 
				<%} %>
            	
                <div id="id01" class="modal">
					  <jsp:include page="/componets/CateForm.html"/>
				</div>
				
				<div id="id02" class="modal">
					  <jsp:include page="/componets/chekarFornecedor.jsp"/>
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