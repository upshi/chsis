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
	public String manage(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "8") int size) {
		PageInfo<FamilyVO> pageInfo = null;
		pageInfo = familyService.selectByConditionAndPaging(null, page, size);
		List<FamilyVO> families = pageInfo.getList();
		model.addAttribute("families", families);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "family/manage?");
		
		return "admin/manageFamily";
	}
	
}
