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
             <jsp:include page="/componets/menu.html"/>
        </nav>
        <div class="contentudo">
      
          <jsp:include page="/componets/header.html"/>
        
        <section>
            <div class="content">
                <h2>Licitação</h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus voluptate suscipit debitis quod. Consequuntur, iusto! Autem similique, animi fugiat sunt sed quos! Harum, doloremque! Rem sapiente corporis saepe at aut.</p>
            </div>
            <div class="content">
                <h2>Licitações</h2>
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Officia, laudantium nemo eveniet esse temporibus est sunt facilis adipisci velit quas placeat voluptatibus saepe, praesentium eligendi unde doloribus itaque eum fugiat.</p>
            </div>
        </section>
       	<jsp:include page="/componets/footer.html"/>
</div>
        <script src="<c:url value="/assets/js/Scripts.js"/>"></script>
            
    </body>
</html>