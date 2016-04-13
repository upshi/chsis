package top.chsis.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;

import top.chsis.service.IFamilyService;
import top.chsis.vo.FamilyVO;

@Controller
@RequestMapping("/family")
public class FamilyController {
	
	@Autowired
	private IFamilyService familyService;

	@RequestMapping("/manage")
	public String manage(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
		PageInfo<FamilyVO> pageInfo = familyService.selectByConditionAndPaging(null, page, size);
		List<FamilyVO> families = pageInfo.getList();
		System.out.println(families.get(0));
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
	
}
