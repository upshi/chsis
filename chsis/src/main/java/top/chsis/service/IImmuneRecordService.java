package top.chsis.service;

import java.util.List;

import top.chsis.model.ImmuneRecord;

public interface IImmuneRecordService {
	int deleteByPrimaryKey(String uuid);

    int insert(ImmuneRecord record);

    int insertSelective(ImmuneRecord record);

    ImmuneRecord selectByPrimaryKey(String uuid);
    
    List<ImmuneRecord> selectImmuneRecordsByPatientUUID(String patientUUID);
    
    List<ImmuneRecord> selectImmuneRecordsByHospitalUUID(String hospitalUUID);

    int updateByPrimaryKeySelective(ImmuneRecord record);

    int updateByPrimaryKey(ImmuneRecord record);
}
