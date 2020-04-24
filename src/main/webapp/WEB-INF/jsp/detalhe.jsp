<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ projeto.nome }</title>
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
					<li><a href="http://localhost:8080/projetos">Lista de
							projetos<span class="sr-only">(current)</span>
					</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="http://localhost:8080/projetos/form">Cadastrar
							projeto</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Nome</th>
							<th>Gerente</th>
							<th>Status</th>
							<th>Risco</th>
							<th>Orcamento</th>
						</tr>
					</thead>
					<tr>
						<td>${ projeto.nome }</td>
						<td>${ projeto.gerente.nome }</td>
						<td>${ projeto.status }</td>
						<td>${ projeto.risco }</td>
						<td>${ projeto.orcamento }</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="row">
			<div class="col">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Data Inicio</th>
							<th>Data Previsao Final</th>
							<c:if test="${ not empty projeto.dataFim }">
								<th>Data Finalização</th>
							</c:if>
						</tr>
					</thead>
					<tr>
						<td>${ projeto.dataInicio }</td>
						<td>${ projeto.dataPrevisaoFim }</td>
						<c:if test="${ not empty projeto.dataFim }">
							<th>${ projeto.dataFim }</th>
						</c:if>
					</tr>
				</table>
			</div>
		</div>

		<div class="row">
			<div class="col">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Descricao</th>
						</tr>
					</thead>
					<tr>
						<td>${ projeto.descricao }</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="row">
			<div class="col"><h3 class="text-center">Membros</h3></div>
			<div class="col-4">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Nome</th>
							<th>Funcionario</th>
						</tr>
					</thead>
					<c:forEach items="${ projeto.membros }" var="membro">
					<tr>
						<td>${ membro.nome }</td>
						<td>${ membro.funcionario }</td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>