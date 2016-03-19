package top.chsis.dao;

import top.chsis.model.News;

public interface NewsMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKeyWithBLOBs(News record);

    int updateByPrimaryKey(News record);
}