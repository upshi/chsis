package top.chsis.model;

import java.util.List;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

public class Hospital {
	private String uuid;//唯一标识一家医院，主键
	private String address;//医院地址
	private List<Doctor> doctors;//医院医生信息
	private List<Department> departments;//医院科室信息
}
