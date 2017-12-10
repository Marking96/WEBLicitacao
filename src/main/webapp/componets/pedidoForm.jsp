<%@ page import="java.util.*, br.com.Licitacao.model.*" %>
<form class="modal-content-fun animate" action="control/funcionarioControl.jsp" method="post" id="formFun">
	<div class="imgcontainer">
		<span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
	</div>
	<div class="container">
		<h3>Novo Funcionario</h3>
		
		<br><label>Setor </label><select name="pedido" required>
				<%
            		Vector<Produto> cc  = (Vector)session.getAttribute("produtos");
            	
            		for(int i = 0; i < cc.size();i++ ){
            	%>	
                		 <option value="<%=cc.get(i).getIdProduto()%>"><%=cc.get(i).getNomeProduto()%></option>
				<%} %>
				
		</select>
		
		<br><label> Quantidade </label><input type="number"name="qtdPro" required>
		<button id="btnsalva" type="submit">Salva</button>
	</div>
		<div class="container" style="background-color:#f1f1f1">
		<button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">Cancela</button>
	</div>
</form>