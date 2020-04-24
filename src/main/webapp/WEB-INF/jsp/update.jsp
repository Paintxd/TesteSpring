<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Projeto</title>
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
		<form:form action="http://localhost:8080/projetos/update" method="post"
			commandName="updateProjetoForm" enctype="multipart/form-data">
			<div class="form-group">
				<label>Nome</label>
				<form:input path="nome" cssClass="form-control"
					value="${ projeto.nome }" />
				<form:errors path="nome" />
			</div>
			<div class="form-group">
				<label>Data Previsao Fim</label>
				<fmt:formatDate var="fmtDate" value="${ projeto.dataPrevisaoFim }"
					pattern="dd/MM/yyyy" />
				<form:input type="date" path="dataPrevisaoFim"
					cssClass="form-control" placeholder="${ fmtDate }" />
				<form:errors path="dataPrevisaoFim" />
			</div>
			<div class="form-group">
				<label>Orcamento</label>
				<form:input path="orcamento" cssClass="form-control"
					value="${ projeto.orcamento }" />
				<form:errors path="orcamento" />
			</div>
			<div class="form-group">
				<label>Descricao</label>
				<form:textarea path="descricao" cssClass="form-control" rows="4"
					value="${ projeto.descricao }" />
				<form:errors path="descricao" />
			</div>
			<div class="form-group">
				<label>Gerente</label>
				<form:select path="gerente" cssClass="form-control">
					<form:option value="${ gerente }"
						label="Selecione Gerente" />
					<form:options items="${ pessoas }" itemValue="id" itemLabel="nome" />
				</form:select>
				<form:errors path="gerente" />
			</div>
			<div class="form-group">
				<label>Risco</label>
				<form:select path="risco" cssClass="form-control" id="Risco">
					<c:forEach var="risc" items="${ riscos }">
						<form:option value="${ risc }" label="${ risc }" />
					</c:forEach>
				</form:select>
				<form:errors path="risco" />
			</div>

			<div class="form-group">
				<label>Adicionar Membro</label>
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>Nome</th>
							<th>Adicionar</th>
						</tr>
					</thead>
					<c:forEach var="pessoa" items="${ pessoas }">
						<tr>
							<td>${ pessoa.nome }</td>
							<td><a type="button" class="btn btn-primary"
								onclick="adiciona('${ projeto.id }', '${ pessoa.id }');">Adicionar
									Membro</a></td>
					</c:forEach>
				</table>
			</div>
			
			<div class="form-group">
				<label>Remover Membro</label>
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>Nome</th>
							<th>Remover</th>
						</tr>
					</thead>
					<c:forEach items="${ projeto.membros }" var="membro">
						<tr>
							<td>${ membro.nome }
							<td><a type="button" class="btn btn-primary"
								onclick="remove('${ projeto.id }', '${ membro.id }');">Remover
									Membro</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>


			<form:input type="hidden" path="id" value="${ projeto.id }" />
			<button type="submit" class="btn btn-primary">Atualizar</button>
		</form:form>
	</div>
	
</body>
<script type="text/javascript">
	function remove(idProjeto, idMembro) {
		$.get("http://localhost:8080/projetos/remover-membro/" + idProjeto + "/" + idMembro)
			.always(function() {
				location.reload();
			})
	};
	
	function adiciona(idProjeto, idMembro) {
		$.get("http://localhost:8080/projetos/adicionar-membro/" + idProjeto + "/" + idMembro)
			.always(function() {
				location.reload();
			})
	};

</script>
</html>