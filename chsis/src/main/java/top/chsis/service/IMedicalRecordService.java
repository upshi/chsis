package top.chsis.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import top.chsis.model.MedicalRecord;
import top.chsis.vo.MedicalRecordVO;

public interface IMedicalRecordService {
	int deleteByPrimaryKey(String uuid);

    int insert(MedicalRecord record);

    int insertSelective(MedicalRecord record);

    MedicalRecord selectByPrimaryKey(String uuid);
    
    List<MedicalRecord> selectMedicalRecordsByPatientUUID(String patientUUID);

    List<MedicalRecord> selectMedicalRecordsByDoctorUUID(String doctorUUID);
    
    int updateByPrimaryKeySelective(MedicalRecord record);

    int updateByPrimaryKey(MedicalRecord record);

	PageInfo<MedicalRecordVO> selectByConditionAndPaging(MedicalRecordVO medicalRecordVO, int page, int size);

	PageInfo<MedicalRecord> selectByConditionAndPagingInResident(MedicalRecord medicalRecord, int page, int size);
}
