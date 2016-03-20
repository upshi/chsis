package top.chsis.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.HospitalMapper;
import top.chsis.model.Hospital;
import top.chsis.service.IHospitalMapperService;

@Service("hospitalService")

public class HospitalMapperServiceImpl implements IHospitalMapperService{
	@Autowired
	private HospitalMapper hospitalMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return hospitalMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(Hospital record) {
		return hospitalMapper.insert(record);
	}

	public int insertSelective(Hospital record) {
		return hospitalMapper.insertSelective(record);
	}

	public Hospital selectByPrimaryKey(String uuid) {
		return hospitalMapper.selectByPrimaryKey(uuid);
	}

	public int updateByPrimaryKeySelective(Hospital record) {
		return hospitalMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Hospital record) {
		return hospitalMapper.updateByPrimaryKey(record);
	}

}
