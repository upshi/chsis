package top.chsis.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import top.chsis.model.Hospital;
import top.chsis.model.HospitalManager;
import top.chsis.model.Manager;
import top.chsis.service.IHospitalManagerService;
import top.chsis.service.IHospitalService;
import top.chsis.service.IManagerService;
import top.chsis.util.StringUtil;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private IHospitalService hospitalService;
	
	@Autowired
	private IHospitalManagerService hospitalManagerService;
	
	@Autowired
	private IManagerService managerService;
	
	@RequestMapping("/hospital")
	public String manageHospital(Model model) {
		List<Hospital> hospitals = hospitalService.selectAll();
		List<HospitalManager> hospitalManagers = hospitalManagerService.selectAll();
		
		model.addAttribute("hospitals", hospitals);
		model.addAttribute("hospitalManagers", hospitalManagers);
		return "admin/manageHospital";
	}
	
	@RequestMapping("/addHospitalManager")
	public String addHospitalManager(Manager manager, String hospitalUuid, Model model) {
		manager.setUuid(StringUtil.getUUID());
		manager.setType(Manager.HOSPITAL_MANAGER);
		
		HospitalManager hospitalManager = new HospitalManager();
		hospitalManager.setUuid(StringUtil.getUUID());
		hospitalManager.setHospital(new Hospital(hospitalUuid));
		hospitalManager.setManager(manager);
		
		managerService.insertHospitalManager(manager, hospitalManager);
		
		return "redirect:/hospital/detail/" + hospitalUuid;
	}
	
	@RequestMapping("/addHospital")
	public String addHospital(Hospital hospital, Model model) {
		hospital.setUuid(StringUtil.getUUID());

		hospitalService.insert(hospital);
		
		return "redirect:/admin/hospital/";
	}
	
}
