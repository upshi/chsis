package top.chsis.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.chsis.model.News;
import top.chsis.util.StringUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})
public class TestNews {
	
	@Autowired
	private NewsMapper newsMapper;
		
	@Test
	public void testSearch() {
		News news = newsMapper.selectByPrimaryKey("1");
		System.out.println(news);
	}
	
	@Test
	public void testInsert() {
		News news = new News();

		news.setUuid(StringUtil.getUUID());
		news.setTitle("外科新闻");
		news.setAuthor("ranran");
		news.setCheckTime("2016.03.16");
		news.setCommitTime("2016.03.15");
		news.setContent("很多事萨克大街上看见了深刻的尽快落实到进口商及付款了坚实的房间开");
		news.setPublisherUUID("1");
		news.setPublishTime("20160318");
		news.setPublisherType(0);
		news.setState(2);
		news.setType(2);
		
		int insert = newsMapper.insert(news);
		System.out.println(insert);
	}

}
