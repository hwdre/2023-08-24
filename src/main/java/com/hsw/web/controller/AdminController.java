package com.hsw.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionIdListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hsw.web.Service.AdminService;
import com.hsw.web.util.Util;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private Util util;
	
	@GetMapping(value = {"/", "/admin"})
	public String adminIndex() {
		return "admin/index";
	}
	
	@PostMapping("/login")
	public String adminLogin(@RequestParam Map<String, Object> map, HttpSession session) {
		//System.out.println(map);
		Map<String, Object> result = adminService.adminLogin(map);
		System.out.println(result);
		if(util.obj2Int(result.get("count")) == 1 && util.obj2Int(result.get("m_grade")) > 5) {
			System.out.println("코딩재밌다.");
			session.setAttribute("mid", map.get("id"));
			session.setAttribute("mname", result.get("m_name"));
			session.setAttribute("mgrade", result.get("m_grade"));
			System.out.println(session.getAttribute("mid"));
			return "/admin/main";
		} else {
			return "redirect:/admin/admin?error=error";
		}
	}
}