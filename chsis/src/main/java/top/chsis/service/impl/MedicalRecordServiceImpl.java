package top.chsis.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.MedicalRecordMapper;
import top.chsis.model.MedicalRecord;
import top.chsis.service.IMedicalRecordService;
import top.chsis.vo.MedicalRecordVO;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

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

	public int[] singleDiseaseStatistics(String diseaseUuid, String year) {
		List<MedicalRecord> list = medicalRecordMapper.selectByDiseaseUuidAndYear(diseaseUuid, year);
		int[] data = new int[12];
		for(MedicalRecord record : list) {
			String month = record.getTime();
			if(month.equals("01")) {
				data[0] = data[0] + 1;
			}
			if(month.equals("02")) {
				data[1] = data[1] + 1;
			}
			if(month.equals("03")) {
				data[2] = data[2] + 1;
			}
			if(month.equals("04")) {
				data[3] = data[3] + 1;
			}
			if(month.equals("05")) {
				data[4] = data[4] + 1;
			}
			if(month.equals("06")) {
				data[5] = data[5] + 1;
			}
			if(month.equals("07")) {
				data[6] = data[6] + 1;
			}
			if(month.equals("08")) {
				data[7] = data[7] + 1;
			}
			if(month.equals("09")) {
				data[8] = data[8] + 1;
			}
			if(month.equals("10")) {
				data[9] = data[9] + 1;
			}
			if(month.equals("11")) {
				data[10] = data[10] + 1;
			}
			if(month.equals("12")) {
				data[11] = data[11] + 1;
			}
		}
		return data;
	}
	
}
