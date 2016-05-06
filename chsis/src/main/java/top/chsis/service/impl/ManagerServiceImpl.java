package top.chsis.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.chsis.dao.HospitalManagerMapper;
import top.chsis.dao.ManagerMapper;
import top.chsis.model.HospitalManager;
import top.chsis.model.Manager;
import top.chsis.service.IManagerService;
import top.chsis.vo.ResidentVO;

@Service("managerService")
public class ManagerServiceImpl implements IManagerService {
	
	@Autowired
	private ManagerMapper managerMapper;
	
	@Autowired
	private HospitalManagerMapper hospitalManagerMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return managerMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(Manager record) {
		return managerMapper.insert(record);
	}

	public int insertSelective(Manager record) {
		return managerMapper.insertSelective(record);
	}

	public Manager selectByPrimaryKey(String uuid) {
		return managerMapper.selectByPrimaryKey(uuid);
	}

	public int updateByPrimaryKeySelective(Manager record) {
		return managerMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Manager record) {
		return managerMapper.updateByPrimaryKey(record);
	}

	public int insertHospitalManager(Manager manager, HospitalManager hospitalManager) {
		int insert = managerMapper.insert(manager);
		int insert2 = hospitalManagerMapper.insert(hospitalManager);
		
		return insert + insert2;
	}

	public Manager selectByUserName(String userName) {
		return managerMapper.selectByUserName(userName);
	}

	public int deleteByHospitalUuid(String hospitalUuid) {
		return 0;
	}

	public PageInfo<Manager> selectByConditionAndPaging(Manager user, int page, int size) {
		PageHelper.startPage(page, size);
		List<Manager> list = new ArrayList<Manager>();
		list = managerMapper.selectByCondition(user);
		PageInfo<Manager> pageInfo = new PageInfo<Manager>(list);
		return pageInfo;
	}

}
