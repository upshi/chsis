package top.chsis.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import top.chsis.model.CheckReport;
import top.chsis.model.Doctor;
import top.chsis.model.MedicalRecord;
import top.chsis.model.Resident;
import top.chsis.model.UploadObject;
import top.chsis.service.ICheckReportService;
import top.chsis.service.IDoctorService;
import top.chsis.service.IMedicalRecordService;
import top.chsis.service.IResidentService;
import top.chsis.util.StringUtil;

@Controller
@RequestMapping("/medicalRecord")
public class MedicalRecordController {
	@Autowired
	private IDoctorService doctorService;
	
	@Autowired
	private IResidentService residentService;
	
	@Autowired
	private IMedicalRecordService medicalRecordService;
	
	@Autowired
	private ICheckReportService checkReportService;
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	@RequestMapping("/toCreate")
	public String toCreate() {
		return "doctor/createMedicalRecord";
	}
	
	@RequestMapping("/create/{patientUuid}")
	public String create(@PathVariable String patientUuid, Model model) {
		Resident patient = residentService.selectByPrimaryKey(patientUuid);
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Doctor doctor = doctorService.selectByUserName(userName);
		
		MedicalRecord medicalRecord = new MedicalRecord();
		medicalRecord.setUuid(StringUtil.getUUID());
		medicalRecord.setPatient(patient);
		medicalRecord.setDoctor(doctor);
		medicalRecord.setTime(sdf.format(new Date()));
		medicalRecord.setState(MedicalRecord.IN_VISITING);
		medicalRecordService.insert(medicalRecord);
		
		model.addAttribute("medicalRecord", medicalRecord);
		return "redirect:/medicalRecord/unfinishedMedicalRecordDetail/" + medicalRecord.getUuid();
	}
	
	@RequestMapping("/edit")
	public String edit(MedicalRecord medicalRecord, Model model) {
		medicalRecordService.updateByPrimaryKeySelective(medicalRecord);
		model.addAttribute("medicalRecord", medicalRecord);
		return "redirect:/medicalRecord/unfinishedMedicalRecordDetail/" + medicalRecord.getUuid();
	}
	
	@RequestMapping("/unfinishedMedicalRecordDetail/{uuid}")
	public String unfinishedMedicalRecordDetail(@PathVariable String uuid, Model model) {
		MedicalRecord medicalRecord = medicalRecordService.selectByPrimaryKey(uuid);
		List<CheckReport> checkReports = checkReportService.selectCheckReportsByMedicalRecordUUID(uuid);
		model.addAttribute("medicalRecord", medicalRecord);
		model.addAttribute("checkReports", checkReports);
		return "doctor/unfinishedMedicalRecordDetail";
	}
	
	@RequestMapping("/addCheckReport")
	public String addCheckReport(String medicalRecordUuid, CheckReport checkReport, Model model, HttpServletRequest request){
		MedicalRecord medicalRecord = medicalRecordService.selectByPrimaryKey(medicalRecordUuid);
		
		checkReport.setUuid(StringUtil.getUUID());
		checkReport.setTime(sdf.format(new Date()));
		checkReport.setMedicalRecord(medicalRecord);
		checkReport.setPatient(medicalRecord.getPatient());
		checkReport.setHospital(medicalRecord.getDoctor().getDepartment().getHospital());
		checkReport.setState(CheckReport.IN_VISITING);
		
		//处理图片
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("file_data");
		String remoteBasePath = UploadObject.DOCTOR_ACCOUNT_PHOTO_BASE_PATH;
		UploadObject uo = new UploadObject(StringUtil.getUUID(), remoteBasePath, multipartFile);
		
		checkReport.setUrl(UploadObject.DOMAIN + uo.getRemotePath());
		try {
			//改造service层的insert方法
			checkReportService.insert(checkReport, uo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("checkReport", checkReport);
		return "redirect:/medicalRecord/unfinishedMedicalRecordDetail/" + medicalRecordUuid;
	}
}
