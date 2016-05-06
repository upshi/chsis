package top.chsis.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.util.Base64;

import top.chsis.model.Hospital;
import top.chsis.model.HospitalManager;
import top.chsis.model.Manager;
import top.chsis.service.IManagerService;
import top.chsis.util.StringUtil;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	private IManagerService managerService;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@RequestMapping("/checkUsernameUnique/{userName}")
	@ResponseBody
	public Map<String, Object> checkUsernameUnique(@PathVariable String userName) {
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
