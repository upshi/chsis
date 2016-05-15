package top.chsis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.CheckRecordMapper;
import top.chsis.model.CheckRecord;
import top.chsis.service.ICheckRecordService;

@Service("checkRecordService")
public class CheckRecordServiceImpl implements ICheckRecordService {
	
	@Autowired
	private CheckRecordMapper checkRecordMapper;

	public int deleteByPrimaryKey(String uuid) {
		return checkRecordMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(CheckRecord record) {
		return checkRecordMapper.insert(record);
	}

	public int insertSelective(CheckRecord record) {
		return checkRecordMapper.insertSelective(record);
	}

	public CheckRecord selectByPrimaryKey(String uuid) {
		return checkRecordMapper.selectByPrimaryKey(uuid);
	}

	public int updateByPrimaryKeySelective(CheckRecord record) {
		return checkRecordMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(CheckRecord record) {
		return checkRecordMapper.updateByPrimaryKey(record);
	}

	public List<CheckRecord> selectByNewsUuid(String newsUuid) {
		return checkRecordMapper.selectByNewsUuid(newsUuid);
	}
	
}
