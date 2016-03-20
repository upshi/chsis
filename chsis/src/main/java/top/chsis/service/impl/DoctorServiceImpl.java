package top.chsis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.DoctorMapper;
import top.chsis.model.Doctor;

@Service("doctorService")
public class DoctorServiceImpl implements DoctorMapper {
	@Autowired
	private DoctorMapper doctorMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return doctorMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(Doctor record) {
		return doctorMapper.insert(record);
	}

	public int insertSelective(Doctor record) {
		return doctorMapper.insertSelective(record);
	}

	public Doctor selectByPrimaryKey(String uuid) {
		return doctorMapper.selectByPrimaryKey(uuid);
	}

	public List<Doctor> selectDoctorsByDepartmentUUID(String departmentUUID) {
		return doctorMapper.selectDoctorsByDepartmentUUID(departmentUUID);
	}

	public int updateByPrimaryKeySelective(Doctor record) {
		return doctorMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Doctor record) {
		return doctorMapper.updateByPrimaryKey(record);
	}

}
