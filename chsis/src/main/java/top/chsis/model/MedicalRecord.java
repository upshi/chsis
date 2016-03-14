package top.chsis.model;

import java.util.List;

public class MedicalRecord {
	private String uuid;//唯一标识一条就诊记录，主键
	private String clinicTime;//就诊时间
	private Doctor doctor;//主诊医生
	private Resident resident;//就诊居民
	private ClinicResult clinicResult;//诊察结果
	private List<Department> departments;//所挂科室
	private Hospital hospital;//就诊医院
	
}
