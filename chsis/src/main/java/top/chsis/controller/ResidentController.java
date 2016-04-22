package top.chsis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import top.chsis.model.Department;
import top.chsis.model.DiseaseHistory;
import top.chsis.model.Resident;
import top.chsis.service.ICommunityService;
import top.chsis.service.IDiseaseHistoryService;
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
	
	@Autowired
	private IDiseaseHistoryService diseaseHistoryService;

	@RequestMapping("/baseInfo")
	public String baseInfo(Model model) {
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Resident resident = residentService.selectByUserName(userName);
		model.addAttribute("resident", resident);
		return "resident/baseInfo";
	}
	
	@RequestMapping("/healthInfo")
	public String healthInfo(Model model) {
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Resident resident = residentService.selectByUserName(userName);
		
		//获得居民的疾病史信息
		List<DiseaseHistory> diseaseHistories = diseaseHistoryService.selectDiseaseHistoriesByPatientUUID(resident.getUuid());
		
		model.addAttribute("resident", resident);
		model.addAttribute("diseaseHistories", diseaseHistories);
		return "resident/healthInfo";
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
	public String editResident(Resident resident, Model model, String url, String leftEyesight, String rightEyesight) {
		//接收前台的leftEyesight，rightEyesight，拼接成完整字符串eyesight，传给后台
		String eyesight = leftEyesight + "," + rightEyesight;
		//为eyesight赋值
		resident.setEyesight(eyesight);
		residentService.updateByPrimaryKeySelective(resident);
		
		//根据不同的参数，返回不同的页面
		if(leftEyesight != null && rightEyesight != null) {
			return "redirect:/resident/healthInfo";
		}else if(url != null) {
			return "redirect:/" + url;
		}else {
			return "redirect:/resident/baseInfo";
		}	
	}
	
	@RequestMapping("/getDiseaseHistory/{uuid}")
	@ResponseBody
	public Map<String, Object> getDiseaseHistory(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			DiseaseHistory diseaseHistory = diseaseHistoryService.selectByPrimaryKey(uuid);
			if(diseaseHistory != null) {
				map.put("result", "success");
				map.put("diseaseHistory", diseaseHistory);
			} else {
				map.put("result", "failure");
			}
		}
		return map;
	}
	
	//添加疾病史
	@RequestMapping("/addDiseaseHistory")
	public String addDiseaseHistory(DiseaseHistory diseaseHistory, Model model, String patientUuid) {
		System.out.println(patientUuid);
		diseaseHistory.setUuid(StringUtil.getUUID());
		Resident resident = new Resident(patientUuid);
		diseaseHistory.setPatient(resident);
		diseaseHistoryService.insert(diseaseHistory);
		return "redirect:/resident/healthInfo";
	}
}
