package com.itwillbs.clever.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class PointController {
	
	@GetMapping(value = "/pointCharge")
	public String pointCharge() {
		return "pay/point_charge_form";
	}
	
}
