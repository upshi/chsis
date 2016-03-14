package top.chsis.model;

import java.util.List;

public class Manager {
	private String uuid;//唯一标识一个管理员
	private String name;//用户名
	private String password;//密码
	private List<Resident> residents;//居民
	private List<Hospital> hospitals;//医院
	private List<HospitalManager> hospitalManagers;//医院管理员
	private List<Assessor> assessors;//审核员
	private List<News> news;//新闻
}
