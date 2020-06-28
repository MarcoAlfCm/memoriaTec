package mx.uaq.uavig.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mx.uaq.uavig.vo.SessionVO;

@Controller	
public class AdminController extends LezardController{
	
	@RequestMapping(value = { "admin/usuarios"})
	public ModelAndView usuarios() {
		ModelAndView model = new ModelAndView();
		model.addObject("session", new SessionVO(getUsuarioLogin()));
		model.setViewName("panelUsuarios");
		return model;
	}
	
}
