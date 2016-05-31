package top.chsis.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import top.chsis.model.Disease;
import top.chsis.model.DiseaseType;
import top.chsis.service.IDiseaseService;
import top.chsis.service.IDiseaseTypeService;
import top.chsis.util.StringUtil;

@Controller
@RequestMapping("/disease")
public class DiseaseController {
	
	@Autowired
	private IDiseaseService diseaseService;
	
	@Autowired
	private IDiseaseTypeService diseaseTypeService;
	
	/*
	 * 根据疾病类型查询疾病
	 */
	@RequestMapping("/list/{uuid}")
	public String list(Model model, @PathVariable String uuid) {
		DiseaseType currentType = diseaseTypeService.selectByPrimaryKey(uuid);
		DiseaseType parentType = null;
		List<Disease> diseases = diseaseService.selectByDiseaseType(uuid);
		if(currentType.getLevel() == 2) {
			parentType = diseaseTypeService.selectByPrimaryKey(currentType.getParentTypeUuid());
		}
		model.addAttribute("size", diseases.size());
		model.addAttribute("diseases", diseases);
		model.addAttribute("currentType", currentType);
		model.addAttribute("parentType", parentType);
		return "disease/diseaseTable";
	}
	
	@RequestMapping("/add")
	public String add(Disease disease) {
		disease.setUuid(StringUtil.getUUID());
		diseaseService.insert(disease);
		return "redirect:/disease/list/" + disease.getDiseaseType().getUuid();
	}

}
