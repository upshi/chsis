package top.chsis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import top.chsis.model.Hospital;
import top.chsis.model.Manager;
import top.chsis.model.Role;
import top.chsis.model.User;
import top.chsis.service.IHospitalService;
import top.chsis.service.IManagerService;
import top.chsis.service.IRoleService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	IManagerService managerService;
	
	@Autowired
	IRoleService roleService;
	
	@Autowired
	IHospitalService hospitalService;
	
	@RequestMapping("/manage")
	public String userManager(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
		PageInfo<Manager> pageInfo = managerService.selectByConditionAndPaging(null, page, size);
		List<Manager> users = pageInfo.getList();
		model.addAttribute("users", users);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "user/manage?");
		return "user/userManager";
	}

	@RequestMapping("/search")
	public String search(Model model, @RequestParam(defaultValue = "1") int page,
			  						  @RequestParam(defaultValue = "5") int size,
			  						  @RequestParam(defaultValue = "") String userName,
			  						  @RequestParam(defaultValue = "") String name) {
		Manager user = new Manager(null, userName, null, name, null, null);
		PageInfo<Manager> pageInfo = managerService.selectByConditionAndPaging(user, page, size);
		List<Manager> users = pageInfo.getList();
		model.addAttribute("users", users);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "user/search?userName=" + userName + 
									"&name=" + name + "&" );
		return "user/userManager";
	}
	
	@RequestMapping("/toAddUser")
	public String toAddUser(Model model) {
		List<Hospital> hospitals = hospitalService.selectAll();
		List<Role> roles = roleService.selectAll();
		
		model.addAttribute("hospitals", hospitals);
		model.addAttribute("roles", roles);
		return "user/addUser";
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUser(User user, Model model, String roleUuid) {
		
		return "user/userDetail";
	}

	@RequestMapping("/delete/{userUuid}")
	@ResponseBody
	public Map<String, Object> userDelte(@PathVariable(value = "userUuid") String userUuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}

	@RequestMapping("/detail/{userUuid}")
	public String userDetail(@PathVariable(value = "userUuid") String userUuid, Model model) {
		return "user/userDetail";
	}

	@RequestMapping("/update/{userUuid}")
	public String userUpdate(@PathVariable(value = "userUuid") String userUuid, Model model) {
		return "user/updateUser";
	}

	@RequestMapping("/updateFinish")
	public String userUpdateFinish(User user, Model model, @RequestParam String companyName) {
		return "user/userDetail";
	}
	
	@RequestMapping("/toAllocateRole/{userUuid}")
	public String toAllocateResource(@PathVariable(value = "userUuid") String userUuid, Model model) {
		
		return "user/allocateRole";
	}

	@RequestMapping("/allocateRole")
	public String allocateResource(String userUuid, String[] roleUuid, Model model) {
		
		return "user/userDetail";
	}
	
	@RequestMapping("/checkUsernameUnique/{username}")
	@ResponseBody
	public Map<String, Object> checkUsernameUnique(@PathVariable(value = "username") String username) {
		Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}
}
