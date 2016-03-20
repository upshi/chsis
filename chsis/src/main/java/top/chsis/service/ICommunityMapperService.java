package top.chsis.service;

import top.chsis.model.Community;

public interface ICommunityMapperService {
	int deleteByPrimaryKey(String uuid);

    int insert(Community record);

    int insertSelective(Community record);

    Community selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Community record);

    int updateByPrimaryKey(Community record);
}
