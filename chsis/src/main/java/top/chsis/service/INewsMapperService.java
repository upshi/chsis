package top.chsis.service;

import top.chsis.model.News;

public interface INewsMapperService {
	int deleteByPrimaryKey(String uuid);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);
}
