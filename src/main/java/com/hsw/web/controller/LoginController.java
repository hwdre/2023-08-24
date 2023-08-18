package com.hsw.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hsw.web.Service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;

	// 2023-08-11 프레임워크 프로그래밍 18일 시
	@GetMapping("/login.sik") // 그냥 이런 식으로 붙여서 쓸 수 있다는 예시 입니다.
	public String login() {
		return "login";
	}

	// 2023-08-16 프레임워크 프로그래밍
	@PostMapping("/login.sik")
	public String login(@RequestParam Map<String, String> map, HttpSession session) {
		// System.out.println(map);
		Map<String, Object> result = loginService.login(map);
		// System.out.println(result);
		if (String.valueOf(result.get("count")).equals("1")) {
			// 정상 로그인이라면 세션만들고, 인덱스로 이동합니다.
			session.setAttribute("mname", result.get("m_name"));
			session.setAttribute("mid", map.get("id"));
			// System.out.println(session.getAttribute("mname"));
			// System.out.println(session.getAttribute("mid"));
			return "redirect:/";
		} else {
			// 정상 로그인이 아니라면 다시 로그인으로 갑니다.
			return "login.sik";
		}
	}

	@GetMapping("/logout.sik")
	public String logout(HttpSession session) {
		if (session.getAttribute("mid") != null) {
			session.removeAttribute("mid");
		}
		if (session.getAttribute("mname") != null) {
			session.removeAttribute("mname");
		}
		/*
		 * 다른 방법 session.invalidate();
		 */
		return "redirect:/";

	}

	// 2023-08-18 요구사항 확인
	// @PathVariable 사용합니다.
	@GetMapping("/myInfo@{id}")
	public ModelAndView myInfo(@PathVariable("id") String id, HttpSession session) {
		System.out.println("jsp가 보내준 값: " + id);
		System.out.println(id.equals(session.getAttribute("mid")));
		//회원가입이나 개인정보 수정할 때, 암호를 암호화합니다.
		
		Map<String, Object> myInfo = loginService.myInfo(id);
		System.out.println(myInfo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("myInfo"); //이동할 jsp파일 명입니다.
		mv.addObject("myInfo", myInfo); //${myInfo.뭐뭐}로 값 불러올 수 있습니다.
		return mv;
	}

}