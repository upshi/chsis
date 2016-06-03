package top.chsis.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import top.chsis.service.IMedicalRecordService;
import top.chsis.vo.StatisticsVO;

@Controller
@RequestMapping("/statistics")
public class StatisticsController {
	
	@Autowired
	private IMedicalRecordService medicalRecordService;

	@RequestMapping("/toSingleDisease")
	public String toSingleDieaseStatistics() {
		return "statistics/singleDisease";
	}
	
	@RequestMapping("/singleDisease")
	@ResponseBody
	public Map<String, Object> singleDisease(StatisticsVO statisticsVO) {
		Map<String, Object> map = new HashMap<String, Object>();
		int[] data = medicalRecordService.singleDiseaseStatistics(statisticsVO.getDiseaseUuid(), statisticsVO.getYear());
		if(data != null && data.length == 12) {
			map.put("result", "success");
			map.put("data", data);
		} else {
			map.put("result", "failure");
		}
		return map;
	}
	
}
