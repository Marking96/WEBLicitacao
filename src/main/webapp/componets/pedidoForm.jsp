<%@ page import="java.util.*, br.com.Licitacao.model.*" %>
<form class="modal-content-fun animate" action="control/funcionarioControl.jsp" method="post" id="formFun">
	<div class="imgcontainer">
		<span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
	</div>
	<div class="container">
		<h3>Novo Funcionario</h3>
		<label> Nome* </label><input type="text" name="Fnome" required>
		<br><label> CPF* </label><input type="text" name="Fcpf" onkeyup="maskIt(this,event,'###.###.###-##')" required>
		<br><label> Email* </label><input type="text"  name="Femail" onblur="validacaoEmail(Femail)"><div id="msgemail"></div>
		<br><label> Telefone* </label><input type="text" name="Ftele" onkeyup="maskIt(this,event,'(##)####-####')">
		<br><label> Celular </label><input type="text"name="fCel" onkeyup="maskIt(this,event,'(##)####-####')">
		<br><label> Rua </label><input type="text"name="Frua" >
		<br><label> Bairro </label><input type="text"name="Fbairo" >
		<br><label>Setor </label><select name="setor" required>
				<%
            		Vector<Setor> cc  = (Vector)session.getAttribute("setores");
            	
            		for(int i = 0; i < cc.size();i++ ){
            	%>	
                		<option value="<%=cc.get(i).getIdSetor()%>"><%=cc.get(i).getNomeSetor() %></option>
				<%} %>
				
		</select>
		
		<br><label> Login* </label><input type="text"name="Flogin" required>
		<br><label> Senha* </label><input type="password" name="Fsenha" required>
		<button id="btnsalva" type="submit">Salva</button>
	</div>
		<div class="container" style="background-color:#f1f1f1">
		<button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">Cancela</button>
	</div>
</form>