package top.chsis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.FamilyMapper;
import top.chsis.model.Family;

@Service("familyService")
public class FamilyMapperServiceImpl implements FamilyMapper {

	@Autowired
	private FamilyMapper familyMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return familyMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(Family record) {
		return familyMapper.insert(record);
	}

	public int insertSelective(Family record) {
		return familyMapper.insertSelective(record);
	}

	public Family selectByPrimaryKey(String uuid) {
		return familyMapper.selectByPrimaryKey(uuid);
	}

	public List<Family> selectFamiliesByCommunityUUID(String communityUUID) {
		return familyMapper.selectFamiliesByCommunityUUID(communityUUID);
	}

	public int updateByPrimaryKeySelective(Family record) {
		return familyMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Family record) {
		return familyMapper.updateByPrimaryKey(record);
	}

}
