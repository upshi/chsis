package top.chsis.model;

import java.io.Serializable;
import java.util.List;

public class MedicalRecord implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String uuid;//唯一标识一条就诊记录，主键
	private Resident patient;//就诊病人
	private String time;//就诊时间
	private Doctor doctor;//主诊医生
	private String disease;//疾病名称
	private String result;//就诊结果：描述，开了啥药~
	private Integer state;//就诊记录的状态：0未检查、1检查中、2已检查
	
	public MedicalRecord() {}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Resident getPatient() {
		return patient;
	}

	public void setPatient(Resident patient) {
		this.patient = patient;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}


	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "MedicalRecord [uuid=" + uuid + ", patient=" + patient + ", time=" + time + ", doctor=" + doctor + ", disease=" + disease + ", result=" + result + ", state=" + state + "]";
	}

}
