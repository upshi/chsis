package top.chsis.dao;

import top.chsis.model.Community;

public interface CommunityMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(Community record);

    int insertSelective(Community record);

    Community selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Community record);

    int updateByPrimaryKey(Community record);
}