package com.hsw.web.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionIdListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.hsw.web.Service.AdminService;
import com.hsw.web.util.Util;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private Util util;
	
	@GetMapping("/")
	public String adminIndex() {
		return "forward:/admin/index"; //redirect와 비슷하지만 다릅니다.
		//forward는 url은 그대로 유지하고 안의 jsp만 바꿉니다.
		//한마디로 forward로 가면 url에 'http://localhost/admin/'이렇게 나오지만 
		//redirect는 'http://localhost/admin/admin'이렇게 나옵니다.
	}
	
	@GetMapping("/admin")
	public String adminIndex2() {
		return "redirect:/admin/admin";
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
			//System.out.println(session.getAttribute("mid"));
			return "redirect:/admin/main";
		} else {
			return "redirect:/admin/admin?error=error";
		}
	}
	
	@GetMapping("/main")
	public String main() {
		return "admin/main"; //admin폴더 속에있는 main.jsp를 읽어서 화면에 보여줍니다.
	}
	
	@GetMapping("/notice")
	public String notice(Model model) {
		//1. 데이터베이스 불러오기
		//2. 데이터 불러오기
		//3. 데이터 jsp로 보내기
		List<Map<String, Object>> noticelist = adminService.noticelist();
		model.addAttribute("noticelist", noticelist);
		//System.out.println(noticelist);
		return "admin/notice";
	}
	
	@PostMapping("/noticeWrite")
	public String noticeWrite(@RequestParam("upfile") MultipartFile mf, @RequestParam Map<String, Object> map) {
		//System.out.println(map); 
		
		if(mf.getSize() > 0) { //!mf.isEmpty()도 같은 의미입니다.
			//저장할 경로를 뽑겠습니다.
			HttpServletRequest rq0 = 
					((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
			String path = rq0.getServletContext().getRealPath("/upload");
			System.out.println("실제 경로: " + path);
			//mf의 정보 보기
			System.out.println(mf.getOriginalFilename());
			System.out.println(mf.getSize());
			System.out.println(mf.getContentType());
			//진짜 파일 업로드 하기 = 경로 + 저장할 파일 명칭
			File newFileName = new File(mf.getOriginalFilename());
		}
		map.put("mno", 3);
		//adminService.noticeWrite(map);
		return "redirect:/admin/notice";
	}
}