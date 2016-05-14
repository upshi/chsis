package top.chsis.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import top.chsis.model.Doctor;
import top.chsis.model.Manager;
import top.chsis.model.News;
import top.chsis.service.IDoctorService;
import top.chsis.service.IManagerService;
import top.chsis.service.INewsService;
import top.chsis.util.StringUtil;

@Controller
@RequestMapping("/news")
public class NewsController {
	
	@Autowired
	private IDoctorService doctorService;
	
	@Autowired
	private IManagerService managerService;
	
	@Autowired
	private INewsService newsService;
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	@RequestMapping("/manage")
	public String doctorManage(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size){
		News news = new News();
		//获取当前登录的用户
		String temp = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userName = temp.split("%")[0];
		String type = temp.split("%")[1];
		if(type.equals("admin")) {
			Manager manager = managerService.selectByUserName(userName);
			if(manager.getType() != Manager.CHECKER_MANAGER) {
				news.setAuthorUuid(manager.getUuid());
			}
		} else {
			Doctor doctor = doctorService.selectByUserName(userName);
			news.setAuthorUuid(doctor.getUuid());
		}
		
		PageInfo<News> pageInfo = newsService.selectByCondition(news, page, size);
		List<News> newsList = pageInfo.getList();
		model.addAttribute("newsList", newsList);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "news/doctorManage?");
		
		return "news/newsManage";
	}
	
	@RequestMapping("/search")
	public String doctorSearch(Model model, @RequestParam(defaultValue = "1") int page,
									  @RequestParam(defaultValue = "5") int size,
									  @RequestParam(defaultValue = "") String title,
									  @RequestParam(defaultValue = "") String submitTime,
									  @RequestParam(defaultValue = "") String state) {
		int realState = Integer.parseInt(state);
		//获取当前登录的用户
		String temp = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userName = temp.split("%")[0];
		String type = temp.split("%")[1];
		String authorUuid = null;
		if(type.equals("admin")) {
			Manager manager = managerService.selectByUserName(userName);
			if(manager.getType() != Manager.CHECKER_MANAGER) {
				authorUuid = manager.getUuid();
			}
		} else {
			Doctor doctor = doctorService.selectByUserName(userName);
			authorUuid = doctor.getUuid();
		}
		
		News news = new News(null, title, authorUuid, null, submitTime, realState);
		
		PageInfo<News> pageInfo = newsService.selectByCondition(news, page, size);
		List<News> newsList = pageInfo.getList();
		model.addAttribute("newsList", newsList);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "news/search?title=" + title + 
									"&submitTime=" + submitTime+
									"&state" + state + "&" );
		
		return "news/newsManage";
	}
	
	@RequestMapping("/toPublish")
	public String publishNews(Model model){
		String temp = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String type = temp.split("%")[1];
		if(type.equals("doctor")) {
			model.addAttribute("role", "doctor");
		} else {
			model.addAttribute("role", "manager");
		}
		return "news/publishNews";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Map<String, Object> add(News news) {
		Map<String, Object> map = new HashMap<String, Object>();
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String realUserName = userName.split("%")[0];
		String type = userName.split("%")[1];
		int insert = 0;
		news.setUuid(StringUtil.getUUID());
		if(type.equals("doctor")) {
			Doctor doctor = doctorService.selectByUserName(realUserName);
			news.setAuthorUuid(doctor.getUuid());
			news.setAuthorType(News.AUTHOR_DOCTOR);
			news.setAuthorName(doctor.getName());
		} else if (type.equals("admin")) {
			Manager manager = managerService.selectByUserName(realUserName);
			news.setAuthorUuid(manager.getUuid());
			if(manager.getType() == Manager.SYSTEM_MANAGER){
				news.setAuthorType(News.AUTHOR_SYSTEMMANAGER);
				news.setType(News.TYPE_COMMUNITY_ANNOCEMNET);
			} else if(manager.getType() == Manager.HOSPITAL_MANAGER) {
				news.setAuthorType(News.AUTHOR_HOSPITALMANAGER);
				news.setType(News.TYPE_HOSPITAL_NOTICE);
			}
			news.setAuthorName(manager.getName());
		}
		
		news.setSubmitTime(sdf.format(new Date()));
		news.setState(News.STATE_CHECKING);
		insert = newsService.insertSelective(news);
		
		if(insert == 1) {
			map.put("result", "success");
		} else {
			map.put("result", "failure");
		}
		return map;
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
