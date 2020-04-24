<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Projetos</title>
<link rel="stylesheet"
	href="../../static/bootstrap-3.3.5-dist/css/bootstrap.css" />
<script src="../../static/lib/jquery-1.11.1.min.js"></script>
<script src="../../static/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand">Empresa</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="http://localhost:8080/projetos">Lista
							de projetos<span class="sr-only">(current)</span>
					</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="http://localhost:8080/projetos/form">Cadastrar
							projeto</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<c:if test="${not empty message }">
		<div class="alert" id="alertaAdd">
			<h4 style="text-align: center">${ message }</h4>
		</div>
	</c:if>

	<div class="container">
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th>Nome</th>
					<th>Gerente</th>
					<th>Status</th>
					<th>Atualizar</th>
					<th>Excluir</th>
					<th>Detalhes</th>
				</tr>
			</thead>
			<c:forEach items="${ projetos }" var="projeto" varStatus="loop">
				<tr>
					<td>${ projeto.nome }</td>
					<td>${ projeto.gerente.nome }</td>
					<td>${ projeto.status }</td>
					<td><a type="button" class="btn btn-primary"
						href="http://localhost:8080/projetos/update/${ projeto.id }">Atualizar</a></td>
					<c:choose>
						<c:when
							test="${ projeto.status=='iniciado' || projeto.status=='andamento' || projeto.status=='encerrado' }">
							<td><a type="button" class="btn btn-primary disabled"
								id="delete">Excluir</a></td>
						</c:when>
						<c:otherwise>
							<td><a type="button" class="btn btn-primary" id="delete"
								href="http://localhost:8080/projetos/delete/${ projeto.id }">Excluir</a></td>
						</c:otherwise>
					</c:choose>

					<td><a type="button" class="btn btn-primary"
						href="http://localhost:8080/projetos/detalhe/${ projeto.id }">Detalhes</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>

<script type="text/javascript">
	$("#alertaAdd").delay(2000).hide("slow");
</script>

<style>
.alert {
	padding: 20px;
	background-color: green;
	color: white;
	margin-bottom: 15px;
}
</style>
</html>

