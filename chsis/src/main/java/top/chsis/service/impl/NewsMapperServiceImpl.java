package top.chsis.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.NewsMapper;
import top.chsis.model.News;

@Service("newsService")
public class NewsMapperServiceImpl implements NewsMapper {
	@Autowired
	private NewsMapper newsMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return newsMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(News record) {
		return newsMapper.insert(record);
	}

	public int insertSelective(News record) {
		return newsMapper.insertSelective(record);
	}

	public News selectByPrimaryKey(String uuid) {
		return newsMapper.selectByPrimaryKey(uuid);
	}

	public int updateByPrimaryKeySelective(News record) {
		return newsMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(News record) {
		return newsMapper.updateByPrimaryKey(record);
	}

}
