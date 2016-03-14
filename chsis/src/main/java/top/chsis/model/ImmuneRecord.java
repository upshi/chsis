package top.chsis.model;

public class ImmuneRecord {
	private String uuid;//唯一标识一条预防免疫记录，主键
	private String immuneTime;//接种时间
	private String vaccine;//疫苗
	private String disease;//预防哪种病症
	private Hospital hospital;//就诊医院医院
	private Doctor doctor;//负责接种的医生
	private Resident resident;//接种居民
}
