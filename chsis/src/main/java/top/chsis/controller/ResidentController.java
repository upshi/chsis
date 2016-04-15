package top.chsis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
import top.chsis.vo.ResidentVO;

@Controller
@RequestMapping("/resident")
public class ResidentController {
	
	@Autowired
	private IResidentService residentService;
	
	@Autowired
	private IFamilyService familyService;
	
	@Autowired
	private ICommunityService communityService;

	@RequestMapping("/baseInfo")
	public String baseInfo() {
		
		return "resident/baseInfo";
	}
	
	@RequestMapping("/manage")
	public String manage(ResidentVO residentVO, Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
		PageInfo<ResidentVO> pageInfo = residentService.selectByConditionAndPaging(null, page, size);
		List<ResidentVO> residents = pageInfo.getList();
		model.addAttribute("residents", residents);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "resident/manage?");
		
		return "admin/manageResident";
	}
	
	@RequestMapping("/search")
	public String search(Model model, @RequestParam(defaultValue = "1") int page,
									  @RequestParam(defaultValue = "5") int size,
									  @RequestParam(defaultValue = "") String userName,
									  @RequestParam(defaultValue = "") String name,
									  @RequestParam(defaultValue = "") String sex,
									  @RequestParam(defaultValue = "") String idNo,
									  @RequestParam(defaultValue = "") String familyNumber) {
		ResidentVO residentVO = new ResidentVO(null,userName,name,sex, idNo, null, familyNumber);
		
		PageInfo<ResidentVO> pageInfo = residentService.selectByConditionAndPaging(residentVO, page, size);
		List<ResidentVO> residents = pageInfo.getList();
		model.addAttribute("residents", residents);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "resident/search?userName=" + userName + 
									"&name=" + name + 
									"&sex=" + sex +
									"&idNo=" + idNo + 
									"&familyNumber=" + familyNumber + "&" );
		
		return "admin/manageResident";
	}
	
	@RequestMapping("/delete/{uuid}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			int result = residentService.deleteByPrimaryKey(uuid);
			if(result == 1) {
				map.put("result", "success");
			} else {
				map.put("result", "failure");
			}
		}
		return map;
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
	
	@RequestMapping("/edit")
	public String editResident(Resident resident, Model model, String url) {
		residentService.updateByPrimaryKeySelective(resident);
		return "redirect:/" + url;
	}
	
}
