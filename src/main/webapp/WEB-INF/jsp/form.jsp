<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro</title>
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
					<li><a href="http://localhost:8080/projetos">Lista
							de projetos<span class="sr-only">(current)</span>
					</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="http://localhost:8080/projetos/form">Cadastrar
							projeto</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="container">
		<form:form action="http://localhost:8080/projetos" method="post"
			commandName="projetoForm" enctype="multipart/form-data">
			<div class="form-group">
				<label>Nome</label>
				<form:input path="nome" cssClass="form-control" />
				<form:errors path="nome" />
			</div>
			<div class="form-group">
				<label>Data Previsao Fim</label>
				<form:input type="date" path="dataPrevisaoFim" cssClass="form-control" />
				<form:errors path="dataPrevisaoFim" />
			</div>
			<div class="form-group">
				<label>Orcamento</label>
				<form:input path="orcamento" cssClass="form-control" />
				<form:errors path="orcamento" />
			</div>
			<div class="form-group">
				<label>Descricao</label>
				<form:textarea path="descricao" cssClass="form-control" rows="4" />
				<form:errors path="descricao" />
			</div>
			<div class="form-group">
				<label>Gerente</label>
				<form:select path="gerente" cssClass="form-control" >
					<form:option value="${ gerente.id }" label="Selecione gerente" />
					<form:options items="${ pessoas }" itemValue="id"
						itemLabel="nome" />
				</form:select>
				<form:errors path="gerente" />
			</div>
			<button type="submit" class="btn btn-primary">Cadastrar</button>
		</form:form>
	</div>
</body>
</html>