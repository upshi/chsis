package top.chsis.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.ManagerMapper;
import top.chsis.model.Manager;

@Service("managerService")
public class ManagerServiceImpl implements ManagerMapper {
	@Autowired
	private ManagerMapper managerMapper;
	
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

}
