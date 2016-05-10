package top.chsis.controller;

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

import top.chsis.model.Community;
import top.chsis.model.Family;
import top.chsis.model.Resident;
import top.chsis.service.ICommunityService;
import top.chsis.service.IFamilyService;
import top.chsis.service.IResidentService;
import top.chsis.util.StringUtil;
import top.chsis.vo.FamilyVO;

@Controller
@RequestMapping("/family")
public class FamilyController {
	
	@Autowired
	private IFamilyService familyService;
	
	@Autowired
	private IResidentService residentService;
	
	@Autowired
	ICommunityService communityService;
	
	@RequestMapping("/familyInfo")
	public String FamilyInfo(Model model){
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Resident resident = residentService.selectByUserName(userName);
		
		//根据登陆的用户查到家庭id，然后根据家庭id查到该家庭下的所有成员
		String familyUuid = resident.getFamily().getUuid();
		List<Resident> residents = residentService.selectResidentsByFamilyUUID(familyUuid);
		
		Family family = familyService.selectByPrimaryKey(familyUuid);
		String  householderUuid = family.getHouseholderUUID();
		Resident householder = residentService.selectByPrimaryKey(householderUuid);
		String householderName = householder.getName();
		
		model.addAttribute("residents", residents);
		model.addAttribute("family", family);
		model.addAttribute("householderName", householderName);
		
		return "resident/familyInfo";
	}

	@RequestMapping("/manage")
	public String manage(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
		PageInfo<FamilyVO> pageInfo = familyService.selectByConditionAndPaging(null, page, size);
		List<FamilyVO> families = pageInfo.getList();
		model.addAttribute("families", families);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "family/manage?");
		
		return "admin/manageFamily";
	}
	
	@RequestMapping("/search")
	public String search(Model model, @RequestParam(defaultValue = "1") int page,
									  @RequestParam(defaultValue = "5") int size,
									  @RequestParam(defaultValue = "") String number,
									  @RequestParam(defaultValue = "") String householderName,
									  @RequestParam(defaultValue = "") String communityName) {
		FamilyVO familyVO = new FamilyVO(null, number, householderName, null, communityName);
		
		PageInfo<FamilyVO> pageInfo = familyService.selectByConditionAndPaging(familyVO, page, size);
		List<FamilyVO> families = pageInfo.getList();
		model.addAttribute("families", families);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "family/search?number=" + number + 
									"&householderName=" + householderName + 
									"&communityName=" + communityName + "&" );
		
		return "admin/manageFamily";
	}
	
	@RequestMapping("/detail/{uuid}")
	public String detail(@PathVariable String uuid,Model model){
		Family family = familyService.selectByPrimaryKey(uuid);
		String householderName =  residentService.selectByPrimaryKey(family.getHouseholderUUID()).getName();
		List<Resident> residents = residentService.selectResidentsByFamilyUUID(uuid);
		model.addAttribute("family", family);
		model.addAttribute("householderName", householderName);
		model.addAttribute("residents",residents);
		return "admin/familyDetail";
	}
	
	@RequestMapping("/get/{uuid}")
	@ResponseBody
	public Map<String, Object> get(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			Resident resident = residentService.selectByPrimaryKey(uuid);
			if(resident != null) {
				map.put("result", "success");
				map.put("resident", resident);
			} else {
				map.put("result", "failure");
			}
		}
		return map;
	}
	
	@RequestMapping("/editFamily")
	public String editFamily(Family family, String communityUuid){
		System.out.println(communityUuid);
		Community community = new Community(communityUuid);
		family.setCommunity(community);
		familyService.updateByPrimaryKeySelective(family);
		return "redirect:/family/familyInfo";
	}
	
	@RequestMapping("/addFamily")
	public String addFamily(Family family, String communityUuid, Model model) {
		Community community = communityService.selectByPrimaryKey(communityUuid);
		family.setUuid(StringUtil.getUUID());
		family.setCommunity(community);
		familyService.insert(family);
		return "redirect:/family/detail/" + family.getUuid();
	}
	
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
