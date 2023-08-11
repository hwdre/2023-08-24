package com.hsw.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	//2023-08-11 프레임워크 프로그래밍 18일 시
	@GetMapping("/login.sik") //그냥 이런 식으로 붙여서 쓸 수 있다는 예시 입니다.
	public String login() {
		return "login";
	}
	
}