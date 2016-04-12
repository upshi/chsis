package top.chsis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/resident")
public class ResidentController {

	@RequestMapping("/baseInfo")
	public String baseInfo() {
		
		return "resident/baseInfo";
	}
	
}
