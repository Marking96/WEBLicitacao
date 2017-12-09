<%@ page import="java.util.*, br.com.Licitacao.model.*" %>
<form class="modal-content-fun animate" action="control/funcionarioControl.jsp" method="post" id="formFun">
	<div class="imgcontainer">
		<span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
	</div>
	<div class="container">
		<h3>Solicitações pendentes</h3>
		<table class="tb-licitacao" style="width:100%" id="tb1">
	                    <thead>
	                        <tr>
	                            <th>N°</th>
	                            <th width="220px">Licitação</th>
	                            <th width="120px" >Opção</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    <% 
		                    Vector<Fornecedor> cc  = (Vector)session.getAttribute("pendente");
		                	
		            		for(int i = 0; i < cc.size();i++ ){
	                    %>
	                    <tr>
	                        <td><%=i %></td>
	                        <td><a href="#"> <%=cc.get(i).getNomeFornecedor()%></a></td>
	                        <td>
	                        <select name="apFornecedor">
	                        		<option value="pendente">Pendente</option>
	                        		<option value="recursar">Recusar</option>
	                        		<option value="aprovado">Aprovar</option>
	                        </select>
	                        </td>
	                    </tr>
	                   <%} %>
	                </tbody>
	                </table>
	                <br>
	                <div id="pageNav"></div>
		<button id="btnsalva" type="submit">Salva</button>
	</div>
		<div class="container" style="background-color:#f1f1f1">
		<button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">Cancela</button>
	</div>
</form>