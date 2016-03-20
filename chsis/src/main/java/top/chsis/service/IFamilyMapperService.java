package top.chsis.service;

import java.util.List;

import top.chsis.model.Family;

public interface IFamilyMapperService {
	int deleteByPrimaryKey(String uuid);

    int insert(Family record);

    int insertSelective(Family record);

    Family selectByPrimaryKey(String uuid);
    
    List<Family> selectFamiliesByCommunityUUID(String communityUUID);

    int updateByPrimaryKeySelective(Family record);

    int updateByPrimaryKey(Family record);
}
