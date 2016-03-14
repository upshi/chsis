package top.chsis.model;

import java.io.Serializable;

public class MedicalHistory implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String uuid;//唯一标识一个疾病、主键
	private String name;//
	private String type;
	private String startTime;
	private String endTime;
	private String description;
	private Resident patient;
	
	public MedicalHistory() {}

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Resident getPatient() {
		return patient;
	}

	public void setPatient(Resident patient) {
		this.patient = patient;
	}

	@Override
	public String toString() {
		return "MedicalHistory [uuid=" + uuid + ", name=" + name + ", type=" + type + ", startTime=" + startTime + ", endTime=" + endTime + ", description=" + description + ", patient=" + patient + "]";
	}
	
}
