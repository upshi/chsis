package top.chsis.dao;

import top.chsis.model.Hospital;

public interface HospitalMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(Hospital record);

    int insertSelective(Hospital record);

    Hospital selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Hospital record);

    int updateByPrimaryKey(Hospital record);
}