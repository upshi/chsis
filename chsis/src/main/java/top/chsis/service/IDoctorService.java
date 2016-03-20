package top.chsis.service;

import java.util.List;

import top.chsis.model.Doctor;

public interface IDoctorService {
	int deleteByPrimaryKey(String uuid);

    int insert(Doctor record);

    int insertSelective(Doctor record);

    Doctor selectByPrimaryKey(String uuid);
    
    List<Doctor> selectDoctorsByDepartmentUUID(String departmentUUID);

    int updateByPrimaryKeySelective(Doctor record);

    int updateByPrimaryKey(Doctor record);
}
