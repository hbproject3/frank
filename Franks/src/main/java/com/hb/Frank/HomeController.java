package com.hb.Frank;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request) {
		System.out.println(Devices.info(request));
		HttpSession session = request.getSession();
		// 濡쒓렇�씤 �젙蹂� �꽭�뀡媛� null媛믪쑝濡� 留뚮뱾�뼱 以섏빞�븿.
		session.setAttribute("unum", null);
		session.setAttribute("uname", null);
		return "home";
	}
	@RequestMapping("logins/login")
	public void login(Model model){
		
	}
	
	
}
