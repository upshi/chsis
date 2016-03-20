package top.chsis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.ImmuneRecordMapper;
import top.chsis.model.ImmuneRecord;
import top.chsis.service.IImmuneRecordService;

@Service("immuneRecordService")
public class ImmuneRecordServiceImpl implements IImmuneRecordService {

	@Autowired
	private ImmuneRecordMapper immuneRecordMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return immuneRecordMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(ImmuneRecord record) {
		return immuneRecordMapper.insert(record);
	}

	public int insertSelective(ImmuneRecord record) {
		return immuneRecordMapper.insertSelective(record);
	}

	public ImmuneRecord selectByPrimaryKey(String uuid) {
		return immuneRecordMapper.selectByPrimaryKey(uuid);
	}

	public List<ImmuneRecord> selectImmuneRecordsByPatientUUID(String patientUUID) {
		return immuneRecordMapper.selectImmuneRecordsByPatientUUID(patientUUID);
	}

	public List<ImmuneRecord> selectImmuneRecordsByHospitalUUID(String hospitalUUID) {
		return immuneRecordMapper.selectImmuneRecordsByHospitalUUID(hospitalUUID);
	}

	public int updateByPrimaryKeySelective(ImmuneRecord record) {
		return immuneRecordMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(ImmuneRecord record) {
		return immuneRecordMapper.updateByPrimaryKey(record);
	}

}
