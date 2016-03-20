package top.chsis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.DepartmentMapper;
import top.chsis.model.Department;

@Service("departmentService")
public class DepartmentMapperServiceImpl implements DepartmentMapper {

	@Autowired
	private DepartmentMapper departmentMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return departmentMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(Department record) {
		return departmentMapper.insert(record);
	}

	public int insertSelective(Department record) {
		return departmentMapper.insertSelective(record);
	}

	public Department selectByPrimaryKey(String uuid) {
		return departmentMapper.selectByPrimaryKey(uuid);
	}

	public List<Department> selectDepartmentsByHospitalUUID(String hospitalUUID) {
		return departmentMapper.selectDepartmentsByHospitalUUID(hospitalUUID);
	}

	public int updateByPrimaryKeySelective(Department record) {
		return departmentMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Department record) {
		return departmentMapper.updateByPrimaryKey(record);
	}

}
