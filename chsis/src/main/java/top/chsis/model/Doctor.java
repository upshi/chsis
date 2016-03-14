package top.chsis.model;

import java.io.Serializable;
import java.util.List;

public class Doctor implements IUser, Serializable {

	private static final long serialVersionUID = 1L;
	private String uuid;// 唯一标识一个医生，主键
	private String userName;// 用户名
	private String password;// 密码
	private String number;// 医生编号
	private String name;// 姓名
	private String photo;// 医生照片
	private String sex;// 性别
	private String phoneNo;// 电话
	private Integer diploma;// 学历：0专科、1本科、2硕士、3博士、4博士后
	private String description;// 个人描述
	private String title;// 医生职称：0护士、1医师、2主治医师、3副主任医师、4主任医师
	private Hospital hospital;// 所在医院
	private Department department;// 所在科室

	public Doctor() {}

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

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public Integer getDiploma() {
		return diploma;
	}

	public void setDiploma(Integer diploma) {
		this.diploma = diploma;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Hospital getHospital() {
		return hospital;
	}

	public void setHospital(Hospital hospital) {
		this.hospital = hospital;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Override
	public String toString() {
		return "Doctor [uuid=" + uuid + ", userName=" + userName + ", password=" + password + ", number=" + number + ", name=" + name + ", photo=" + photo + ", sex=" + sex + ", phoneNo=" + phoneNo + ", diploma=" + diploma + ", description=" + description + ", title=" + title + ", hospital=" + hospital + ", department=" + department + "]";
	}
	
}
