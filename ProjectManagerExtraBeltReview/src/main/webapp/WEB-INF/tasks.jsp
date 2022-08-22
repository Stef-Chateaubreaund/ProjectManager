<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Nova Tarefa</title>
</head>
<body>

<h2><a href="/dashboard">Pagina Inicial</a></h2>

<h1>Projeto  : ${project.title}</h1>
<h5>Lider do projeto : ${project.lead.firstName}</h5>

<form:form action="/projects/${project.id}/tasks" method="post" modelAttribute="task">
	<table>
	    <thead>
	        <tr>
	            <td class="float-left">Adicione uma nova terefa</td>
	            <td class="float-left">
	            	<form:errors path="name" class="text-danger"/>
					<form:textarea rows="4" class="input" path="name"/>
	            </td>
	        </tr>
	        <tr>
	        	<td colspan=2><input class="input" class="button" type="submit" value="Salvar"/></td>
	        </tr>
	    </thead>
	</table>
</form:form>
<hr>
<c:forEach var="task" items="${tasks}">
	<h4>Added by <c:out value="${task.creator.firstName}"></c:out> at <fmt:formatDate value="${task.createdAt}" pattern="h:mm a MMMM dd"/>:</h4>
	<p><c:out value="${task.name}"></c:out></p>
</c:forEach>
</body>
</html>