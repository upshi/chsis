package top.chsis.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.chsis.dao.MedicalRecordMapper;
import top.chsis.model.MedicalRecord;
import top.chsis.service.IMedicalRecordService;
import top.chsis.vo.MedicalRecordVO;

@Service("medicalRecordService")
public class MedicalRecordServiceImpl implements IMedicalRecordService {

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

	public PageInfo<MedicalRecordVO> selectByConditionAndPaging(MedicalRecordVO medicalRecordVO, int page, int size) {
		PageHelper.startPage(page, size);
		List<MedicalRecordVO> list = new ArrayList<MedicalRecordVO>();
		list = medicalRecordMapper.selectByCondition(medicalRecordVO);
		PageInfo<MedicalRecordVO> pageInfo = new PageInfo<MedicalRecordVO>(list);
		return pageInfo;
	}

	public PageInfo<MedicalRecord> selectByConditionAndPagingInResident(MedicalRecord medicalRecord, int page, int size) {
		PageHelper.startPage(page, size);
		List<MedicalRecord> list = new ArrayList<MedicalRecord>();
		list = medicalRecordMapper.selectByConditionInResident(medicalRecord);
		PageInfo<MedicalRecord> pageInfo = new PageInfo<MedicalRecord>(list);
		return pageInfo;
	}
	
	public PageInfo<MedicalRecordVO> selectByConditionAndPagingInResidentVO(MedicalRecordVO medicalRecordVO, int page, int size) {
		PageHelper.startPage(page, size);
		List<MedicalRecordVO> list = new ArrayList<MedicalRecordVO>();
		list = medicalRecordMapper.selectByConditionInResidentVO(medicalRecordVO);
		PageInfo<MedicalRecordVO> pageInfo = new PageInfo<MedicalRecordVO>(list);
		return pageInfo;
	}

}
