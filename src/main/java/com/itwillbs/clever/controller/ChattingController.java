package com.itwillbs.clever.controller;

import org.slf4j.Logger;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChattingController {

//	@GetMapping("/chatting")
//	public void chat(Model model) {
		
//		CustomUser user = (CustomUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		
//		Logger.info("@ChatController, GET Chat / Username : " + user.getUsername());
//		
//		model.addAttribute("userid", user.getUsername());
//	}
	
	@GetMapping("/chatTest")
	public String chatTest() {
		return "chatting/test";
	}
}
