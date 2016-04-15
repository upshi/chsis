package top.chsis.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import top.chsis.model.Department;
import top.chsis.model.Hospital;
import top.chsis.model.HospitalManager;
import top.chsis.model.Manager;
import top.chsis.service.IDepartmentService;
import top.chsis.util.StringUtil;

@Controller
@RequestMapping("/department")
public class DepartmentContrller {
	
	@Autowired
	private IDepartmentService departmentService;
	
	
	@RequestMapping("/manage")
	public String manageHospital(Model model) {
		List<Department> departments = departmentService.selectAll();
		System.out.println("---------------------"+departments);
		model.addAttribute("departments", departments);
		return "hospitalManager/manageDepartment";
	}
	
}
