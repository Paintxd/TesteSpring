package br.com.biblioteca.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.biblioteca.controller.form.ProjetoForm;
import br.com.biblioteca.controller.form.UpdateProjetoForm;
import br.com.biblioteca.model.Pessoa;
import br.com.biblioteca.model.Projeto;
import br.com.biblioteca.model.Risco;
import br.com.biblioteca.repository.PessoaRepository;
import br.com.biblioteca.repository.ProjetoRepository;

@Controller
@RequestMapping("/projetos")
public class ProjetosController {

	@Autowired
	private ProjetoRepository projetoRepo;

	@Autowired
	private PessoaRepository pessoaRepo;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView listaProjetos() {
		List<Projeto> projetos = projetoRepo.findAll();

		ModelAndView modelView = new ModelAndView("index");
		modelView.addObject("projetos", projetos);

		return modelView;
	}

	@RequestMapping("/form")
	public ModelAndView form(ProjetoForm projeto) {
		List<Pessoa> pessoas = pessoaRepo.findAll();

		ModelAndView modelView = new ModelAndView("form");
		modelView.addObject("pessoas", pessoas);

		return modelView;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView cadastro(@Valid ProjetoForm form, BindingResult result, RedirectAttributes redirectAttributes) {

		if (result.hasErrors()) {
			return form(form);
		}

		Projeto projeto = form.converte();
		projetoRepo.save(projeto);
		redirectAttributes.addFlashAttribute("message", "Novo projeto cadastrado com sucesso");

		return new ModelAndView("redirect:/projetos");
	}

	@RequestMapping("/delete/{id}")
	public ModelAndView delete(@PathVariable Long id) {
		projetoRepo.delete(id);
		return new ModelAndView("redirect:/projetos");
	}

	@RequestMapping("/detalhe/{id}")
	public ModelAndView detalhe(@PathVariable Long id) {
		Projeto projeto = projetoRepo.findOne(id);

		ModelAndView modelView = new ModelAndView("detalhe");
		modelView.addObject("projeto", projeto);

		return modelView;
	}

	@RequestMapping("/update/{id}")
	public ModelAndView update(@PathVariable Long id, UpdateProjetoForm form) {
		List<Pessoa> pessoas = pessoaRepo.findAll();

		List<Pessoa> funcionarios = pessoas.stream().filter(e -> e.getFuncionario()).collect(Collectors.toList());

		Projeto projeto = projetoRepo.findOne(id);

		ModelAndView modelView = new ModelAndView("update");
		modelView.addObject("pessoas", funcionarios);
		modelView.addObject("projeto", projeto);
		modelView.addObject("riscos", new ArrayList<Risco>(Arrays.asList(Risco.values())));
		
		return modelView;
	}
	
	@RequestMapping(value= "/update", method = RequestMethod.POST)
	public ModelAndView updater(@Valid UpdateProjetoForm form, BindingResult result, RedirectAttributes redirectAttributes) {

		if (result.hasErrors()) {
			return update(form.getId(), form);
		}
		
		form.update(projetoRepo);
		

		redirectAttributes.addFlashAttribute("message", "Projeto " + form.getNome() +  " atualizado");

		return new ModelAndView("redirect:/projetos");
	}
	
	@RequestMapping("/remover-membro/{idProjeto}/{idMembro}")
	public void removeMembro(@PathVariable("idProjeto") Long idProjeto, @PathVariable("idMembro") Long idMembro) {

		projetoRepo.deleteMembro(idProjeto, idMembro);
		
		
		update(idProjeto, new UpdateProjetoForm());
	}

	@RequestMapping("/adicionar-membro/{idProjeto}/{idMembro}")
	public void adicionarMembro(@PathVariable("idProjeto") Long idProjeto, @PathVariable("idMembro") Long idMembro) {

		projetoRepo.insertMembro(idProjeto, idMembro);
		
		update(idProjeto, new UpdateProjetoForm());
	}
	
}
