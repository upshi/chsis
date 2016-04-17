package top.chsis.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.util.Base64;

import top.chsis.model.Department;
import top.chsis.model.Doctor;
import top.chsis.model.UploadObject;
import top.chsis.service.IDoctorService;
import top.chsis.util.StringUtil;

@Controller
@RequestMapping("/doctor")
public class DoctorController {
	@Autowired
	private IDoctorService doctorService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	//添加医生
	@RequestMapping("/addDoctor")
	public String addDoctor(Doctor doctor,Model model,String departmentUuid,HttpServletRequest request){
		doctor.setUuid(StringUtil.getUUID());
		doctor.setDepartment(new Department(departmentUuid));

		//Base64解码得到原始密码
		String rawPassword = new String(Base64.decodeFast(doctor.getPassword()));
		//BCrypt加密密码
		String encodedPassword = passwordEncoder.encode(rawPassword);
		doctor.setPassword(encodedPassword);
		
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("file_data");
		String remoteBasePath = UploadObject.DOCTOR_ACCOUNT_PHOTO_BASE_PATH;
		UploadObject uo = new UploadObject(doctor.getUuid(), remoteBasePath, multipartFile);
		
		doctor.setPhoto(UploadObject.DOMAIN + uo.getRemotePath());
		try {
			doctorService.insert(doctor, uo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/department/detail/" + departmentUuid;
	}
	
	//删除医生
	@RequestMapping("/delete/{uuid}")
	@ResponseBody
	public Map<String, Object> deleteDoctor(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			int result = doctorService.deleteByPrimaryKey(uuid);
			if(result == 1) {
				map.put("result", "success");
			} else {
				map.put("result", "该医生有创建就诊记录等信息，所以不能删除该医生哦~");
			}
		}
		return map;
	}
	
	@RequestMapping("/get/{uuid}")
	@ResponseBody
	public Map<String, Object> get(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			Doctor doctor = doctorService.selectByPrimaryKey(uuid);
			if(doctor != null) {
				map.put("result", "success");
				map.put("doctor", doctor);
			} else {
				map.put("result", "failure");
			}
		}
		return map;
	}
}
