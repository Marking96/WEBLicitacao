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
    <div class="contanner">
        <header class="cabecario">
            <div class="logo1">
                <h3>Logo aqui</h3>
            </div>
        </header>
        <section>
            <div class="form">
                <div class="tabs">
                    <button class="tablinks" onclick="openTap(event,'entra')" id="opcpadrao" >Entrar</button>
                    <button class="tablinks" onclick="openTap(event,'cadastra')">Cadastrar Fornecedor</button>
                </div>
                <div class="formulario" id="entra">
                    <div class="title-form-Login">
                        <h2>Login</h2>
                    </div>
                                   
                    <form action="" method="POST">
                        <div class="email-login">
                            <span>
                                 <i class="icon-l medium material-icons">account_circle</i>
                            </span>
                            <input type="email" name="Usuario" placeholder="Email" id="email">
                        </div>
                        <br>
                        <div class="psw-login">
                            <span>
                                <i class="icon-l medium material-icons">vpn_key</i>
                            </span>
                           <input type="password" name="" id="senha" name="senha" placeholder="Senha">
                        </div>
                        <br>
                        <input type="submit" value="Entra">
                    </form>
                </div>
                <div class="formulario" id="cadastra">
                    <form action="control/fornecedorControl.jsp" method="POST">
                        <div class="title-form-Login">
                            <h2>Cadastro de Fornecedor</h2>
                        </div>
                        <input type="text" name="f-nome" id="for_nome" placeholder="Nome Completo">
                        <br>
                        <input type="text" name="f-cnpj" id="for_cnpj-cpf" placeholder="CPF/CNPJ">
                        <br>
                        <select name="f-categoria" id="">
                                <%
            						Vector<Categoria> cc  = (Vector)session.getAttribute("categoria");
            	
            						for(int i = 0; i < cc.size();i++ ){
            					%>	
                					<option value="<%=cc.get(i).getIdCategoria()%>"><%=cc.get(i).getNomeCategoria() %></option>
							<%} %>
                        </select>
                        <br>
                        <input type="text" name="f-login" id="for_username" placeholder="Username">
                        <input type="password" name="f-senha" id="for_senha" placeholder="Senha">
                        <input type="password" name="f-checkSenha" id="for_checkSenha" placeholder="Digite a senha Novamente">
                        <input type="submit" value="Cadastra">
                    </form>
                </div>
            </div>                      
        </section>
        
        <footer>
            <p>
                Â© SGA. All Rights Reserved | Design by
            </p>
        </footer>
        <script>

            function openTap(evt, cityName) {
                // Declare all variables
                var i, tabcontent, tablinks;

                // Get all elements with class="tabcontent" and hide them
                tabcontent = document.getElementsByClassName("formulario");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }

                // Get all elements with class="tablinks" and remove the class "active"
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }

                // Show the current tab, and add an "active" class to the button that opened the tab
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
            }

            document.getElementById("opcpadrao").click();
        </script>
</div>
</body>
</html>