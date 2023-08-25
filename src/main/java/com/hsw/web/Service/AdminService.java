package com.hsw.web.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.node.ObjectNode;
import com.hsw.web.dao.AdminDAO;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO adminDAO;

	public Map<String, Object> adminLogin(Map<String, Object> map) {
		
		return adminDAO.adminLogin(map);
	}

	public List<Map<String, Object>> noticelist() {
		return adminDAO.noticelist();
	}

	public void noticeWrite(Map<String, Object> map) {
		adminDAO.noticeWrite(map);
	}

	public String noticeDetail(int nno) {
		
		return adminDAO.noticeDetail(nno);
	}

	public int noticeHide(int nno) {
		
		return adminDAO.noticeHide(nno);
	}

	public List<Map<String, Object>> setupBoardList() {
		// TODO Auto-generated method stub
		return adminDAO.setupBoardList();
	}

	public int multiboard(Map<String, Object> map) {
		return adminDAO.multiboard(map);
		
	}

	public List<Map<String, Object>> memberList() {
		
		return adminDAO.memberList();
	}

	public int gradeChange(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return adminDAO.gradeChange(map);
	}
}
