package top.chsis.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;

import top.chsis.service.IResidentService;
import top.chsis.vo.ResidentVO;

@Controller
@RequestMapping("/resident")
public class ResidentController {
	
	@Autowired
	private IResidentService residentService;

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
	
}
