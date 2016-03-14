package top.chsis.model;

import java.util.List;

public class News {
	private String uuid;//唯一标识一条新闻，主键
	private String title;//新闻标题
	private String type;//新闻类别
	private String Content;//新闻内容
	private String CheckTime;//审核时间
	private String commitTime;//提交时间
	private String publishTime;//发布时间
	private Doctor doctor;//医生发布的新闻
	private Manager manager;//管理员发布的新闻
	private HospitalManager hospitalManager;//医院管理员发布的新闻
	private Integer state;//新闻的状态
}
