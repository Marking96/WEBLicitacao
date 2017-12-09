
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<%!final String URL = "/SistemaLicitacao/";%>
	<div class="menu">
               
                <ul class="listNav">
                    <li>
                        <a 
                        <% if(request.getRequestURI().equals(URL+"index.jsp")){ %>
                        class="active" 
                        <%} %>
                        href="index.jsp">
                            <i class="material-icons">home</i>Home</a>
                    </li>
                    <li>
                        <a
                        <% if(request.getRequestURI().equals(URL+"listaSetor.jsp")){ %>
                        class="active" 
                        <%} %>
                         href="listaSetor.jsp">
                            <i class="material-icons">mode_edit</i>Setores</a>
                    </li>
                    <li>
                        <a 
                        <% if(request.getRequestURI().equals(URL+"licitacao.jsp")){ %>
                        class="active" 
                        <%} %>
                        href="licitacao.jsp">
                            <i class="material-icons">filter_none</i>Licitações</a>
                    </li>
                    <li>
                        <a 
                        <% if(request.getRequestURI().equals(URL+"fornecedores.jsp")){ %>
                        class="active" 
                        <%} %>
                        href="fornecedores.jsp">
                            <i class="material-icons">business_center</i>Fornecedores</a>
                    </li>
                    <li>
                        <a href="http://">
                            <i class="material-icons">build</i>Suporte</a>
            	</li>
        
        
          </ul>
     </div>

