package top.chsis.vo;

public class MedicalRecordVO {
	
	private String uuid;
	private String name;//姓名	
	private String sex;//性别：0男、1女
	private String idNo;//身份证号
	private String time;//就诊时间
	private String disease;//疾病名称
	private String doctorUuid;//医生的id
	
	public MedicalRecordVO() {}

	public MedicalRecordVO(String uuid, String name, String sex, String idNo, String time, String disease, String doctorUuid) {
		super();
		this.uuid = uuid;
		this.name = name;
		this.sex = sex;
		this.idNo = idNo;
		this.time = time;
		this.disease = disease;
		this.doctorUuid = doctorUuid;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getIdNo() {
		return idNo;
	}

	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	public String getDoctorUuid() {
		return doctorUuid;
	}

	public void setDoctorUuid(String doctorUuid) {
		this.doctorUuid = doctorUuid;
	}

	@Override
	public String toString() {
		return "MedicalRecordVO [uuid=" + uuid + ", name=" + name + ", sex=" + sex + ", idNo=" + idNo + ", time=" + time + ", disease=" + disease + ", doctorUuid=" + doctorUuid + "]";
	}
	
}
