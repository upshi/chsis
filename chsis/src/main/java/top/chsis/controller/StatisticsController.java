package top.chsis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/statistics")
public class StatisticsController {

	@RequestMapping("/toSingleDisease")
	public String toSingleDieaseStatistics() {
		return "statistics/singleDisease";
	}
	
}
