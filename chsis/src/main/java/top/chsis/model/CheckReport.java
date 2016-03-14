package top.chsis.model;

import java.io.Serializable;

public class CheckReport implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String uuid;//唯一标识一条就诊结果，主键
	private String name;//报告名称
	private String description;//病情描述
	private String time;//诊察时间
	private Resident patient;//就诊病人
	private Hospital hospital;//就诊医院
	
	public CheckReport() {}

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Resident getPatient() {
		return patient;
	}

	public void setPatient(Resident patient) {
		this.patient = patient;
	}

	public Hospital getHospital() {
		return hospital;
	}

	public void setHospital(Hospital hospital) {
		this.hospital = hospital;
	}

	@Override
	public String toString() {
		return "CheckReport [uuid=" + uuid + ", name=" + name + ", description=" + description + ", time=" + time + ", patient=" + patient + ", hospital=" + hospital + "]";
	}
	
}
