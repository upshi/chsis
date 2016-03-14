package top.chsis.model;

import java.util.List;

public class Community {
	private String uuid;//唯一标识一个社区，主键
	private List<Family> families;//社区里的家庭
	private List<Resident> residents;//社区里的居民信息
}
