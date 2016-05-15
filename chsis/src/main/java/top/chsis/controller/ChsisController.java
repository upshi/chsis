package top.chsis.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;

import top.chsis.model.News;
import top.chsis.service.INewsService;
import top.chsis.util.StringUtil;

@Controller
public class ChsisController {
	
	@Autowired
	private INewsService newsService;
	
	@RequestMapping("/index")
	public String index(Model model) {
		List<News> hospitalNotice = newsService.selectByType(News.TYPE_HOSPITAL_NOTICE);
		List<News> doctorWords = newsService.selectByType(News.TYPE_DOCTOR_WORDS);
		List<News> dailyHealth = newsService.selectByType(News.TYPE_DAILY_HEALTH);
		List<News> announcements = newsService.selectByType(News.TYPE_COMMUNITY_ANNOCEMNET);
		model.addAttribute("hospitalNotice", hospitalNotice);
		model.addAttribute("doctorWords", doctorWords);
		model.addAttribute("dailyHealth", dailyHealth);
		model.addAttribute("announcements", announcements);
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
	
	@RequestMapping("/newsList")
	public String newsList(String type, Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "8") int size){
		News news = new News();
		news.setState(News.STATE_PASS);
		if(!StringUtil.isNoE(type)) {
			news.setType(Integer.parseInt(type));
		}
		PageInfo<News> pageInfo = newsService.selectByConditionWithType(news, page, size);
		List<News> newsList = pageInfo.getList();
		model.addAttribute("type", type);
		model.addAttribute("newsList", newsList);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "newsList?type=" + type + "&");
		
		return "chsis/newsList";
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
