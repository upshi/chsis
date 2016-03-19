package top.chsis.model;

import java.io.Serializable;

public class Log implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String uuid;
	private String user;
	private Integer userType;
	private String time;
	private String operation;
	private String detail;
	private Integer state;
	
	public Log() {
		super();
	}

	public Log(String uuid, String user, Integer userType, String time, String operation, String detail, Integer state) {
		super();
		this.uuid = uuid;
		this.user = user;
		this.userType = userType;
		this.time = time;
		this.operation = operation;
		this.detail = detail;
		this.state = state;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Log [uuid=" + uuid + ", user=" + user + ", userType=" + userType + ", time=" + time + ", operation=" + operation + ", detail=" + detail + ", state=" + state + "]";
	}

}
