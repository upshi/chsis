package top.chsis.dao;

import top.chsis.model.CheckRecord;

public interface CheckRecordMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(CheckRecord record);

    int insertSelective(CheckRecord record);

    CheckRecord selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(CheckRecord record);

    int updateByPrimaryKey(CheckRecord record);
}