package br.com.biblioteca.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.validator.constraints.NotEmpty;


@Entity
public class Projeto implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@NotEmpty
	private Long id;

	@NotEmpty
	private String nome;

	@Temporal(TemporalType.TIMESTAMP)
	private Date dataInicio;

	@Temporal(TemporalType.TIMESTAMP)
	private Date dataPrevisaoFim;

	@Temporal(TemporalType.TIMESTAMP)
	private Date dataFim;

	private String descricao;

	@Enumerated(EnumType.STRING)
	private Status status;

	private Double orcamento;

	@Enumerated(EnumType.STRING)
	private Risco risco;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idgerente")
	@NotEmpty
	private Pessoa gerente;

	@OneToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "membros", joinColumns = @JoinColumn(name = "idprojeto", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "idpessoa", referencedColumnName = "id"))
	private List<Pessoa> membros = new ArrayList<Pessoa>();

	public Projeto() {
	}

	public Projeto(String nome, String descricao, Double orcamento, Pessoa gerente, Date dataPrevisaoFim) {
		this.nome = nome;
		this.descricao = descricao;
		this.orcamento = orcamento;
		this.gerente = gerente;
		this.dataPrevisaoFim = dataPrevisaoFim;
		this.dataInicio = new Date();
		this.status = Status.analise;
	}

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

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Double getOrcamento() {
		return orcamento;
	}

	public void setOrcamento(Double orcamento) {
		this.orcamento = orcamento;
	}

	public Risco getRisco() {
		return risco;
	}

	public void setRisco(Risco risco) {
		this.risco = risco;
	}

	public Pessoa getGerente() {
		return gerente;
	}

	public void setGerente(Pessoa gerente) {
		this.gerente = gerente;
	}

	public List<Pessoa> getMembros() {
		return membros;
	}

	public void setMembros(List<Pessoa> membros) {
		this.membros = membros;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public Date getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

	public Date getDataPrevisaoFim() {
		return dataPrevisaoFim;
	}

	public void setDataPrevisaoFim(Date dataPrevisaoFim) {
		this.dataPrevisaoFim = dataPrevisaoFim;
	}

	public Date getDataFim() {
		return dataFim;
	}

	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}

}
