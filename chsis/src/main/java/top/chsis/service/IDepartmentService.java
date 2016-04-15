package top.chsis.service;

import java.util.List;

import top.chsis.model.Department;

public interface IDepartmentService {
	int deleteByPrimaryKey(String uuid);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(String uuid);
    
    List<Department> selectAll();
    
    List<Department> selectDepartmentsByHospitalUUID(String hospitalUUID);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);

}
