package top.chsis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.CheckReportMapper;
import top.chsis.model.CheckReport;
import top.chsis.service.ICheckReportService;

@Service("checkReportService")
public class CheckReportServiceImpl implements ICheckReportService {
	
	@Autowired
	private CheckReportMapper checkReportMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return checkReportMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(CheckReport record) {
		return checkReportMapper.insert(record);
	}

	public int insertSelective(CheckReport record) {
		return checkReportMapper.insertSelective(record);
	}

	public CheckReport selectByPrimaryKey(String uuid) {
		return checkReportMapper.selectByPrimaryKey(uuid);
	}

	public List<CheckReport> selectCheckReportsByPatientUUID(String patientUUID) {
		return checkReportMapper.selectCheckReportsByPatientUUID(patientUUID);
	}

	public List<CheckReport> selectCheckReportsByHospitalUUID(String hospitalUUID) {
		return checkReportMapper.selectCheckReportsByHospitalUUID(hospitalUUID);
	}

	public List<CheckReport> selectCheckReportsByMedicalRecordUUID(String medicalrecordUUID) {
		return checkReportMapper.selectCheckReportsByMedicalRecordUUID(medicalrecordUUID);
	}

	public int updateByPrimaryKeySelective(CheckReport record) {
		return checkReportMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(CheckReport record) {
		return checkReportMapper.updateByPrimaryKey(record);
	}

}
