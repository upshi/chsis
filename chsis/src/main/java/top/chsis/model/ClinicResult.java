package top.chsis.model;

import java.util.List;

public class ClinicResult {
	private Integer id;//唯一标识一条就诊结果，主键
	private String description;//病情描述
	private String consultationTime;//诊察时间
	private Doctor doctor;//主诊医生
	private Resident resident;//就诊居民
	private List<Department> departments;//所挂科室
	private Hospital hospital;//就诊医院
}
