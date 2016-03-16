package top.chsis.model;

import java.io.Serializable;

public class Log implements Serializable{
	
	private String uuid;
	private IUser user;
	private Integer userType;
	private String time;
	private String operation;
	private String detail;
	
	public Log() {
		super();
	}

	public Log(String uuid, IUser user, Integer userType, String time, String operation, String detail) {
		super();
		this.uuid = uuid;
		this.user = user;
		this.userType = userType;
		this.time = time;
		this.operation = operation;
		this.detail = detail;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public IUser getUser() {
		return user;
	}

	public void setUser(IUser user) {
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

	@Override
	public String toString() {
		return "Log [uuid=" + uuid + ", user=" + user + ", userType=" + userType + ", time=" + time + ", operation=" + operation + ", detail=" + detail + "]";
	}
	
}
