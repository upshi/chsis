package top.chsis.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.chsis.dao.CommunityMapper;
import top.chsis.dao.FamilyMapper;
import top.chsis.dao.ResidentMapper;
import top.chsis.model.Resident;
import top.chsis.service.IResidentService;
import top.chsis.vo.ResidentVO;

@Service("residentService")
public class ResidentServiceImpl implements IResidentService {
	
	@Autowired
	private ResidentMapper residentMapper;
	
	@Autowired
	private FamilyMapper familyMapper;
	
	@Autowired
	private CommunityMapper communityMapper;

	public int deleteByPrimaryKey(String uuid) {
		int result = residentMapper.deleteByPrimaryKey(uuid);
		return result;
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

	public PageInfo<ResidentVO> selectByConditionAndPaging(ResidentVO residentVO, int page, int size) {
		PageHelper.startPage(page, size);
		List<ResidentVO> list = new ArrayList<ResidentVO>();
		list = residentMapper.selectByCondition(residentVO);
		PageInfo<ResidentVO> pageInfo = new PageInfo<ResidentVO>(list);
		return pageInfo;
	}

	public Resident selectByUserName(String userName) {
		return residentMapper.selectByUserName(userName);
	}

	public List<Resident> selectAll() {
		return residentMapper.selectAll();
	}

	public List<ResidentVO> selectByDimIdNo(String idNo) {
		return residentMapper.selectByDimIdNo(idNo);
	}

}
