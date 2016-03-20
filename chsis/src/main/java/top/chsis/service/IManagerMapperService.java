package top.chsis.service;

import top.chsis.model.Manager;

public interface IManagerMapperService {
	int deleteByPrimaryKey(String uuid);

    int insert(Manager record);

    int insertSelective(Manager record);

    Manager selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);
}
