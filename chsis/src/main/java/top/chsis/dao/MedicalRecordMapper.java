package top.chsis.dao;

import java.util.List;

import top.chsis.model.MedicalRecord;

public interface MedicalRecordMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(MedicalRecord record);

    int insertSelective(MedicalRecord record);

    MedicalRecord selectByPrimaryKey(String uuid);
    
    List<MedicalRecord> selectMedicalRecordsByPatientUUID(String patientUUID);

    List<MedicalRecord> selectMedicalRecordsByDoctorUUID(String doctorUUID);
    
    int updateByPrimaryKeySelective(MedicalRecord record);

    int updateByPrimaryKeyWithBLOBs(MedicalRecord record);

    int updateByPrimaryKey(MedicalRecord record);
}