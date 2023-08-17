package com.hsw.web.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

@Mapper
public interface LoginDAO {

	public Map<String, Object> login(Map<String, String> map);

}
