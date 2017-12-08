<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="java.util.*, br.com.Licitacao.model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<% 
		Setor set = new  Setor();
		Vector<Setor> setores;
		
		setores = set.listarSetores();
		session.setAttribute("setores", new Setor().listarSetores());
		
	%>
	<jsp:include page="setor.jsp"/>
	
</body>
</html>