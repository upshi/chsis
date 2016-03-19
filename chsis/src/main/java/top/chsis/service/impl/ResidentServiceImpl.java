package top.chsis.service.impl;

import java.util.List;

import org.springframework.aop.ThrowsAdvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.ResidentMapper;
import top.chsis.exception.ResidentException;
import top.chsis.model.Resident;
import top.chsis.service.IResidentService;

@Service("residentService")
public class ResidentServiceImpl implements IResidentService {
	
	@Autowired
	private ResidentMapper residentMapper;
	

	public int deleteByPrimaryKey(String uuid) throws ResidentException {
		int result = residentMapper.deleteByPrimaryKey(uuid);
		if(result == 1) {
			return 1;
		} else {
			throw new ResidentException("您删除的用户不存在"); 
		} 
	}

	public int insert(Resident record) {
		return residentMapper.insert(record);
	}

	public int insertSelective(Resident record) {
		return residentMapper.insertSelective(record);
	}

	public Resident selectByPrimaryKey(String uuid) {
		return residentMapper.selectByPrimaryKey(uuid);
	}

	public List<Resident> selectResidentsByFamilyUUID(String familyUUID) {
		return residentMapper.selectResidentsByFamilyUUID(familyUUID);
	}

	public int updateByPrimaryKeySelective(Resident record) {
		return residentMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Resident record) {
		return residentMapper.updateByPrimaryKey(record);
	}

}
