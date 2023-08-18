package com.hsw.web.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

@Mapper
public interface NoticeDAO {

	List<Map<String, Object>> list();
	
	
}
