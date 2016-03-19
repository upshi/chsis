package top.chsis.dao;

import java.util.List;

import top.chsis.model.Resident;

public interface ResidentMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(Resident record);

    int insertSelective(Resident record);

    Resident selectByPrimaryKey(String uuid);
    
    List<Resident> selectResidentsByFamilyUUID(String familyUUID);

    int updateByPrimaryKeySelective(Resident record);

    int updateByPrimaryKey(Resident record);
}