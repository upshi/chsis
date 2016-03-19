package top.chsis.service;

import java.util.List;

import top.chsis.exception.ResidentException;
import top.chsis.model.Resident;

public interface IResidentService {

	int deleteByPrimaryKey(String uuid) throws ResidentException;

	int insert(Resident record);

	int insertSelective(Resident record);

	Resident selectByPrimaryKey(String uuid);

	List<Resident> selectResidentsByFamilyUUID(String familyUUID);

	int updateByPrimaryKeySelective(Resident record);

	int updateByPrimaryKey(Resident record);

}
