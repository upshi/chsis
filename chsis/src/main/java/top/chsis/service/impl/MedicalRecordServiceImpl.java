package top.chsis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.MedicalRecordMapper;
import top.chsis.model.MedicalRecord;

@Service("medicalRecordService")
public class MedicalRecordServiceImpl implements MedicalRecordMapper {

	@Autowired
	private MedicalRecordMapper medicalRecordMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return medicalRecordMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(MedicalRecord record) {
		return medicalRecordMapper.insert(record);
	}

	public int insertSelective(MedicalRecord record) {
		return medicalRecordMapper.insertSelective(record);
	}

	public MedicalRecord selectByPrimaryKey(String uuid) {
		return medicalRecordMapper.selectByPrimaryKey(uuid);
	}

	public List<MedicalRecord> selectMedicalRecordsByPatientUUID(String patientUUID) {
		return medicalRecordMapper.selectMedicalRecordsByPatientUUID(patientUUID);
	}

	public List<MedicalRecord> selectMedicalRecordsByDoctorUUID(String doctorUUID) {
		return medicalRecordMapper.selectMedicalRecordsByDoctorUUID(doctorUUID);
	}

	public int updateByPrimaryKeySelective(MedicalRecord record) {
		return medicalRecordMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(MedicalRecord record) {
		return medicalRecordMapper.updateByPrimaryKey(record);
	}

}
