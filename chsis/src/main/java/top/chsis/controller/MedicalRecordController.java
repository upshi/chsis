package top.chsis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/medicalRecord")
public class MedicalRecordController {
	
	@RequestMapping("/create")
	public String create() {
		return "doctor/createMedicalRecord";
	}
	
	@RequestMapping("/unfinishedMedicalRecordDetail")
	public String unfinished() {
		return "doctor/unfinishedMedicalRecordDetail";
	}
}
