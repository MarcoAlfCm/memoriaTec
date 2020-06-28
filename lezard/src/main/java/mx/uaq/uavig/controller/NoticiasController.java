package mx.uaq.uavig.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import mx.uaq.uavig.vo.SessionVO;

@RestController
public class NoticiasController extends LezardController{

	@RequestMapping(value = { "admin/noticia", "maestro/noticia", "alumno/noticia"})
	public ModelAndView verNoticias() {
		ModelAndView model = new ModelAndView();
		model.addObject("session", new SessionVO(getUsuarioLogin()));

		model.addObject("usuario", getUsuarioLogin());

		model.setViewName("verNoticia");
		return model;

	}
	
	@RequestMapping(value = { "admin/agregarNoticias","enlace/agregarNoticias","encargado/agregarNoticias"})
	public ModelAndView Agregarnoticias() {
		ModelAndView model = new ModelAndView();
		model.addObject("session", new SessionVO(getUsuarioLogin()));
		
		model.addObject("usuario", getUsuarioLogin());
		
		model.setViewName("agregarNoticia");
		
		return model;
	}
}
