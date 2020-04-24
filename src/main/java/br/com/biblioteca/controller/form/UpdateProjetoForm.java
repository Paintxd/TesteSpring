package br.com.biblioteca.controller.form;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import br.com.biblioteca.model.Pessoa;
import br.com.biblioteca.model.Projeto;
import br.com.biblioteca.model.Risco;
import br.com.biblioteca.repository.ProjetoRepository;

public class UpdateProjetoForm {

	private Long id;

	@NotNull(message = "Obrigatorio")
	@Size(min = 5, message = "Minimo de cinco caracteres")
	private String nome;

	@NotNull(message = "Obrigatorio")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dataPrevisaoFim;

	@NotNull(message = "Obrigatorio")
	private Double orcamento;

	@NotNull(message = "Obrigatorio")
	@Size(min = 20, max = 200, message = "Minimo de 20 e maximo de 200 caracteres")
	private String descricao;

	@NotNull(message = "Obrigatorio")
	private Pessoa gerente;

	@NotNull(message = "Obrigatorio")
	private Risco risco;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Date getDataPrevisaoFim() {
		return dataPrevisaoFim;
	}

	public void setDataPrevisaoFim(Date dataPrevisaoFim) {
		this.dataPrevisaoFim = dataPrevisaoFim;
	}

	public Double getOrcamento() {
		return orcamento;
	}

	public void setOrcamento(Double orcamento) {
		this.orcamento = orcamento;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Pessoa getGerente() {
		return gerente;
	}

	public void setGerente(Pessoa gerente) {
		this.gerente = gerente;
	}

	public Risco getRisco() {
		return risco;
	}

	public void setRisco(Risco risco) {
		this.risco = risco;
	}
	
	public void update(ProjetoRepository projetoRepo) {
		Projeto projeto = projetoRepo.findOne(this.id);
		
		projeto.setNome(this.nome);
		projeto.setDataPrevisaoFim(this.dataPrevisaoFim);
		projeto.setOrcamento(this.orcamento);
		projeto.setDescricao(this.descricao);
		projeto.setGerente(this.gerente);
		projeto.setRisco(this.risco);
		
	}

}
