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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.util.Base64;
import com.github.pagehelper.PageInfo;

import top.chsis.model.Hospital;
import top.chsis.model.HospitalManager;
import top.chsis.model.Manager;
import top.chsis.service.IHospitalManagerService;
import top.chsis.service.IHospitalService;
import top.chsis.service.IManagerService;
import top.chsis.util.StringUtil;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	private IManagerService managerService;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	IHospitalService hospitalService;
	
	@Autowired
	IHospitalManagerService hospitalManagerService;
	
	@RequestMapping("/manage")
	public String userManager(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
		PageInfo<Manager> pageInfo = managerService.selectByConditionAndPaging(null, page, size);
		List<Manager> managers = pageInfo.getList();
		model.addAttribute("managers", managers);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "manager/manage?");
		return "admin/managerManage";
	}

	@RequestMapping("/search")
	public String search(Model model, @RequestParam(defaultValue = "1") int page,
			  						  @RequestParam(defaultValue = "5") int size,
			  						  @RequestParam(defaultValue = "") String userName,
			  						  @RequestParam(defaultValue = "") String name) {
		Manager manager = new Manager(null, userName, null, name, null, null);
		PageInfo<Manager> pageInfo = managerService.selectByConditionAndPaging(manager, page, size);
		List<Manager> managers = pageInfo.getList();
		model.addAttribute("managers", managers);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "manager/search?userName=" + userName + 
									"&name=" + name + "&" );
		return "admin/managerManage";
	}
	
	@RequestMapping("/toAddManager")
	public String toAddManager(Model model) {
		List<Hospital> hospitals = hospitalService.selectAll();
		model.addAttribute("hospitals", hospitals);
		return "admin/addManager";
	}

	@RequestMapping(value = "/addManager", method = RequestMethod.POST)
	public String addManager(Manager manager, String hospitalUuid, Model model) {
		Hospital hospital = null;
		manager.setUuid(StringUtil.getUUID());
		//Base64解码得到原始密码
		String rawPassword = new String(Base64.decodeFast(manager.getPassword()));
		//BCrypt加密密码
		String encodedPassword = passwordEncoder.encode(rawPassword);
		manager.setPassword(encodedPassword);
		
		if(manager.getType() == 0){
			HospitalManager hospitalManager = new HospitalManager();
			hospitalManager.setUuid(StringUtil.getUUID());
			hospital = hospitalService.selectByPrimaryKey(hospitalUuid);
			hospitalManager.setHospital(hospital);
			hospitalManager.setManager(manager);
			managerService.insertHospitalManager(manager, hospitalManager);
		} else {
			managerService.insert(manager);
		}
		model.addAttribute("manager", manager);
		model.addAttribute("hospitalName", hospital.getName());
		
		return "admin/managerDetail";
	}

	@RequestMapping("/checkUserNameUnique/{userName}")
	@ResponseBody
	public Map<String, Object> checkUsernameUnique(@PathVariable(value = "userName") String userName) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(userName)) {
			map.put("result", "exist");
		} else {
			Manager manager = managerService.selectByUserName(userName);
			if(manager == null) {
				map.put("result", "inexistence");
			} else {
				map.put("result", "exist");
			}
		}
		return map;
	}

	@RequestMapping("/delete/{uuid}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			int result = managerService.deleteByPrimaryKey(uuid);
			if(result == 1) {
				map.put("result", "success");
			} else {
				map.put("result", "failure");
			}
		}
		return map;
	}
	
	@RequestMapping("/detail/{managerUuid}")
	public String managerDetail(@PathVariable(value = "managerUuid") String managerUuid, Model model) {
		Manager manager = new Manager();
		Hospital hospital = new Hospital();
		HospitalManager hospitalManager = new HospitalManager();
		
		manager = managerService.selectByPrimaryKey(managerUuid);
		
		hospitalManager = hospitalManagerService.selectByManagerUuid(managerUuid);
		if(hospitalManager != null && !hospitalManager.equals("")){
			hospital = hospitalManager.getHospital();
			model.addAttribute("hospitalName", hospital.getName());
		}
		model.addAttribute("manager", manager);
		return "admin/managerDetail";
	}
	
	@RequestMapping("/get/{uuid}")
	@ResponseBody
	public Map<String, Object> get(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			Manager manager = managerService.selectByPrimaryKey(uuid);
			if(manager != null) {
				manager.setPassword(null);
				manager.setType(null);
				
				//根据管理员id，判断是否是医院管理员，如果是医院管理员则展示医院名称
				HospitalManager hospitalManager = hospitalManagerService.selectByManagerUuid(uuid);
				if(hospitalManager != null && !hospitalManager.equals("")){
					Hospital hospital = hospitalManager.getHospital();
					map.put("hospitalName", hospital.getName());
				}
				
				map.put("result", "success");
				map.put("manager", manager);
			} else {
				map.put("result", "failure");
			}
		}
		return map;
	}
	
	@RequestMapping("/editHospitalManager")
	public String editHospitalManager(Manager manager, Model model, String hospitalUuid) {
		managerService.updateByPrimaryKeySelective(manager);
		return "redirect:/hospital/detail/" + hospitalUuid;
	}
	
	@RequestMapping("/addHospitalManager")
	public String addHospitalManager(Manager manager, String hospitalUuid, Model model) {
		manager.setUuid(StringUtil.getUUID());
		manager.setType(Manager.HOSPITAL_MANAGER);
		
		HospitalManager hospitalManager = new HospitalManager();
		hospitalManager.setUuid(StringUtil.getUUID());
		hospitalManager.setHospital(new Hospital(hospitalUuid));
		
		//Base64解码得到原始密码
		String rawPassword = new String(Base64.decodeFast(manager.getPassword()));
		//BCrypt加密密码
		String encodedPassword = passwordEncoder.encode(rawPassword);
		manager.setPassword(encodedPassword);
		
		hospitalManager.setManager(manager);
		managerService.insertHospitalManager(manager, hospitalManager);
		
		return "redirect:/hospital/detail/" + hospitalUuid;
	}
	
}
