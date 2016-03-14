package top.chsis.model;

import java.util.List;

public class Doctor {
	private String uuid;//唯一标识一个医生，主键
	private String name;//姓名
	private String password;//密码
	private String sex;//性别
	private String idNo;//身份证号
	private String phoneNo;//电话
	private String educationBackground;//学历
	private String description;//个人描述
	private String title;//医生职称：主任医生、副主任医生
	private Hospital hospital;//所在医院
	private Department department;//所在科室
	private List<News> news;//发布的新闻
}
