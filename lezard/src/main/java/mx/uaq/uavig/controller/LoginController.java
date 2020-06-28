package mx.uaq.uavig.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mx.uaq.uavig.vo.SessionVO;

@Controller
public class LoginController  extends LezardController{

	@RequestMapping(value = "login")
	public ModelAndView user() {
		ModelAndView model = new ModelAndView();
		model.setViewName("login");
		model.addObject("session", new SessionVO(getUsuarioLogin()));

		return model;
	}
	


}
