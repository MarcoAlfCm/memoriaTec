package mx.uaq.uavig.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller	
public class DashboardController extends LezardController{

	@RequestMapping(value = { "admin/dashboard", "maestro/dashboard", "alumno/dashboard","seguimiento/dashboard"})
	public ModelAndView dashboard() {
		ModelAndView model = new ModelAndView();
		model.addObject("usuario", getUsuarioLogin());
		model.setViewName("dashboard");
		
		return model;
	}
}
