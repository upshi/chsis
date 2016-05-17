package top.chsis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.util.Base64;
import com.github.pagehelper.PageInfo;

import top.chsis.model.Community;
import top.chsis.model.Family;
import top.chsis.model.News;
import top.chsis.model.Resident;
import top.chsis.service.IFamilyService;
import top.chsis.service.INewsService;
import top.chsis.service.IResidentService;
import top.chsis.util.RandomCodeUtil;
import top.chsis.util.StringUtil;

@Controller
public class ChsisController {
	
	@Autowired
	private IResidentService residentService;
	
	@Autowired
	private IFamilyService familyService;
	
	@Autowired
	private INewsService newsService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@RequestMapping("/userIndex")
	public String userIndex() {
		return "index";
	}
	
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
	
	//居民注册时，加入家庭
	@RequestMapping("/register_joinFamily")
	@ResponseBody
	public Map<String, Object> register_joinFamily(Resident resident, String familyNumber){
		Map<String, Object> map = new HashMap<String, Object>();
		//Base64解码得到原始密码
		String rawPassword = new String(Base64.decodeFast(resident.getPassword()));
		//BCrypt加密密码
		String encodedPassword = passwordEncoder.encode(rawPassword);
		String idNo = resident.getIdNo();
		String birth = idNo.substring(6, 14);
		int sex = idNo.charAt(16) - 48;//身份证上第17位代表性别,下标从0开始
		resident.setUuid(StringUtil.getUUID());
		resident.setPassword(encodedPassword);
		if(sex % 2 == 0){
			resident.setSex(1);//身份证上第17位为偶数代表女，数据库中1代表女
		}else {
			resident.setSex(0);//身份证上第17位为奇数代表男，数据库中0代表男
		}
		resident.setBirth(birth);
		Family family = familyService.selectByNumber(familyNumber);
		resident.setFamily(family);;

		int insert = residentService.insertResident(resident);
		if(insert == 2) {
			map.put("result", "success");
		} else {
			map.put("result", "failure");
		}
		return map;
	}
	
	//居民注册时新建家庭，同时默认该家庭的户主是就是注册者本人
	@RequestMapping("/register_createFamily")
	@ResponseBody
	public Map<String, Object> register_createFamily(Resident resident, String familyPhone, String familyAddress, String communityUuid){
		Map<String, Object> map = new HashMap<String, Object>();
		//Base64解码得到原始密码
		String rawPassword = new String(Base64.decodeFast(resident.getPassword()));
		//BCrypt加密密码
		String encodedPassword = passwordEncoder.encode(rawPassword);
		String idNo = resident.getIdNo();
		String birth = idNo.substring(6, 14);
		int sex = idNo.charAt(16) - 48;//身份证上第17位代表性别,下标从0开始
		resident.setUuid(StringUtil.getUUID());
		resident.setPassword(encodedPassword);
		if(sex % 2 == 0){
			resident.setSex(1);//身份证上第17位为偶数代表女，数据库中1代表女
		}else {
			resident.setSex(0);//身份证上第17位为奇数代表男，数据库中0代表男
		}
		resident.setBirth(birth);
	
		//为家庭赋值
		Family family = new Family();
		Community community = new Community(communityUuid);
		family.setUuid(StringUtil.getUUID());
		//随机生成六位数的家庭编号
		String familyNumber = RandomCodeUtil.numberSix();
		//校验该随机生成的家庭编号存在，若存在则重新生成
		while(familyService.selectByNumber(familyNumber) != null) {
			familyNumber = RandomCodeUtil.numberSix();
		};
		family.setNumber(familyNumber);
		family.setPhone(familyPhone);
		family.setHouseholderUUID(resident.getUuid());
		family.setAddress(familyAddress);
		family.setCommunity(community);
		resident.setFamily(family);
		
		int insert = residentService.insertResidentAndFamily(resident, family);
		if(insert == 4) {
			map.put("result", "success");
		} else {
			map.put("result", "failure");
		}
		return map;
	}
	
	//居民注册时检查用户名是否重复
	@RequestMapping("/checkUserNameUnique/{userName}")
	@ResponseBody
	public Map<String, Object> checkUserNameUnique(@PathVariable String userName) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(userName)) {
			map.put("result", "exist");
		} else {
			Resident resident = residentService.selectByUserName(userName);
			if(resident == null) {
				map.put("result", "inexistence");
			} else {
				map.put("result", "exist");
			}
		}
		return map;
	}
	
	//居民注册时检查身份证号是否重复
	@RequestMapping("/checkIdNoUnique/{idNo}")
	@ResponseBody
	public Map<String, Object> checkIdNoUnique(@PathVariable String idNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(idNo)) {
			map.put("result", "exist");
		} else {
			Resident resident = residentService.selectByIdNo(idNo);
			if(resident == null) {
				map.put("result", "inexistence");
			} else {
				map.put("result", "exist");
			}
		}
		return map;
	}
	
	
	//居民注册时，选择加入家庭，输入家庭编号后校验该家庭是否存在
	@RequestMapping("/checkNumberUnique/{number}")
	@ResponseBody
	public Map<String, Object> checkNumberUnique(@PathVariable String number) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(number)) {
			map.put("result", "exist");
		} else {
			Family family = familyService.selectByNumber(number);
			if(family == null) {
				map.put("result", "inexistence");
			} else {
				map.put("result", "exist");
			}
		}
		return map;
	}

}
