package com.hsw.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hsw.web.Service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	//2023-08-11 프레임워크 프로그래밍 18일 시
	@GetMapping("/login.sik") //그냥 이런 식으로 붙여서 쓸 수 있다는 예시 입니다.
	public String login() {
		return "login";
	}
	
	//2023-08-16 프레임워크 프로그래밍
	@PostMapping("/login.sik")
	public String login(@RequestParam Map<String, String> map, HttpSession session) {
		//System.out.println(map);
		Map<String, Object> result = loginService.login(map);
		//System.out.println(result);
		if(String.valueOf(result.get("count")).equals("1")) {
			//정상 로그인이라면 세션만들고, 인덱스로 이동합니다.
			session.setAttribute("mname", result.get("m_name"));
			session.setAttribute("mid", map.get("id"));
			//System.out.println(session.getAttribute("mname"));
			//System.out.println(session.getAttribute("mid"));
			return "redirect:/";
		} else {
			//정상 로그인이 아니라면 다시 로그인으로 갑니다.
			return "login.sik";
		}
	}
	
	@GetMapping("/logout.sik")
	public String logout(HttpSession session) {
		if(session.getAttribute("mid") != null) {
			session.removeAttribute("mid");
		}
		if(session.getAttribute("mname") != null) {
			session.removeAttribute("mname");
		}
		/*다른 방법
		 * session.invalidate();*/
		return "redirect:/";
		
	}
	
}