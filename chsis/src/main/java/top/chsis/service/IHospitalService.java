package top.chsis.service;

import top.chsis.model.Hospital;

public interface IHospitalService {
	int deleteByPrimaryKey(String uuid);

    int insert(Hospital record);

    int insertSelective(Hospital record);

    Hospital selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Hospital record);

    int updateByPrimaryKey(Hospital record);
}
