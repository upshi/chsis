package top.chsis.model;

import java.io.Serializable;
import java.util.List;

public class Manager implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String uuid;//唯一标识一个管理员
	private String userName;//用户名
	private String password;//密码
	private String name;//姓名
	private String phone;//电话
	private Integer type;//类型：0医院管理员、1内容管理员、2系统管理员
	
	public Manager() {}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Manager [uuid=" + uuid + ", userName=" + userName + ", password=" + password + ", name=" + name + ", phone=" + phone + ", type=" + type + "]";
	}
	
}
