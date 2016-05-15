package top.chsis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import top.chsis.model.News;
import top.chsis.service.INewsService;

@Controller
public class ChsisController {
	
	@Autowired
	private INewsService newsService;
	
	@RequestMapping("/index")
	public String index() {
		return "chsis/index";
	}
	
	@RequestMapping("/announcement")
	public String announcement() {
		return "chsis/announcement";
	}
	
	@RequestMapping("/contact")
	public String contact() {
		return "chsis/contact";
	}
	
	@RequestMapping("/dayhealth")
	public String dayhealth() {
		return "chsis/dayhealth";
	}
	
	@RequestMapping("/hospital")
	public String hospital() {
		return "chsis/hospital";
	}
	
	@RequestMapping("/introduce")
	public String introduce() {
		return "chsis/introduce";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "chsis/login";
	}
	
	@RequestMapping("/register")
	public String register(Model model) {
		return "chsis/register";
	}
	
	@RequestMapping("/newslist")
	public String newslist(Model model) {
		return "chsis/newslist";
	}
	
	@RequestMapping("/detail/{uuid}")
	public String detail(@PathVariable("uuid") String uuid, Model model) {
		News news = newsService.selectByPrimaryKey(uuid);
		if(news == null) {
			return "redirect:/index";
		}
		model.addAttribute("news", news);
		return "chsis/news";
	}
	
}
