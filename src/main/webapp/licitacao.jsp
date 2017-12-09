<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	                            <th>N°</th>
	                            <th width="300px">Licitação</th>
	                            <th width="100px">Setor</th>
	                            <th width="100px" >Data</th>
	                            <th>Aprova</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        
	                    
	                    <tr>
	                        <td>1</td>
	                        <td>ew</td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td>2</td>
	                        <td>22eq</td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td>3</td>
	                        <td>wew</td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                </tbody>
	                </table>
	                <br>
	                <div id="pageNav"></div>
	            </div>
	        </section>
	       	<jsp:include page="/componets/footer.html"/>
	</div>
    <script src="<c:url value="/assets/js/Scripts.js"/>"></script>
    <script>
        var pager = new Pager('tb1', 10);
        pager.init();
        pager.showPageNav('pager', 'pageNav');
        pager.showPage(1);
                
    </script>
    </body>
</html>