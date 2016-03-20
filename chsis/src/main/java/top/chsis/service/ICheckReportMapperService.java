package top.chsis.service;

import java.util.List;

import top.chsis.model.CheckReport;

public interface ICheckReportMapperService {
	int deleteByPrimaryKey(String uuid);

    int insert(CheckReport record);

    int insertSelective(CheckReport record);

    CheckReport selectByPrimaryKey(String uuid);
    
    List<CheckReport> selectCheckReportsByPatientUUID(String patientUUID);

    List<CheckReport> selectCheckReportsByHospitalUUID(String hospitalUUID);

    List<CheckReport> selectCheckReportsByMedicalRecordUUID(String medicalrecordUUID);
    
    int updateByPrimaryKeySelective(CheckReport record);

    int updateByPrimaryKey(CheckReport record);
}
