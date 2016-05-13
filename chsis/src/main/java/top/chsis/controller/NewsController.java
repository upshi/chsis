package top.chsis.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import top.chsis.model.News;
import top.chsis.service.IDoctorService;
import top.chsis.service.IManagerService;

@Controller
@RequestMapping("/news")
public class NewsController {
	
	@Autowired
	private IDoctorService doctorService;
	
	@Autowired
	private IManagerService managerService;
	
	
	@RequestMapping("/manage")
	public String manage(){
		return "news/newsManage";
	}
	
	@RequestMapping("/toPublish")
	public String publishNews(){
		return "news/publishNews";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Map<String, Object> add(News news) {
		Map<String, Object> map = new HashMap<String, Object>();
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println(userName);
		
		/*map.put("result", "inexistence");
		map.put("result", "exist");*/
		return map;
	}
}