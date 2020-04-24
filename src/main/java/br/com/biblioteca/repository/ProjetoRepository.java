package br.com.biblioteca.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import br.com.biblioteca.model.Projeto;

public interface ProjetoRepository extends JpaRepository<Projeto, Long> {

	@Query(value = "delete from membros where idpessoa = ?1 and idprojeto = ?2", nativeQuery = true)
	void deleteMembro(Long idMembro, Long idProjeto);
	
	@Query(value = "insert into membros (idprojeto, idpessoa) values (?1, ?2)", nativeQuery = true)
	void insertMembro(Long idProjeto, Long idMembro);
	
}
