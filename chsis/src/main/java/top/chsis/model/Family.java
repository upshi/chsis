package top.chsis.model;

import java.util.List;

public class Family {
	private Integer id;//唯一标识一个家庭，主键
	private List<Resident> residents;//家庭成员
	private String homeAddress;//家庭住址
}
