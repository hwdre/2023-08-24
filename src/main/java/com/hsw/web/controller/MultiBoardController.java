package com.hsw.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hsw.web.Service.MultiBoardService;

@Controller
public class MultiBoardController {
	
	@Autowired
	private MultiBoardService mbService;
	
	@GetMapping("/multiboard")
	public String multiboard(@RequestParam(value = "board", required = false, defaultValue = "1") int board, Model model) {
		
		List<Map<String, Object>> list = mbService.list(board);
		model.addAttribute("list",list);
		//System.out.println(list);
		
		return "multiboard";	
	}
	
	@GetMapping("/mbwrite")
	public String mbWrite(@RequestParam(value = "board", required = false, defaultValue = "1") int board, Model model,
			HttpSession session) {
		if(session.getAttribute("mid") != null) {
		model.addAttribute("board", board);
		return "mbwrite";
		} else {
			return "redirect:/login.sik?error=login";
		}
	}
	
	@PostMapping("/mbwrite")
	public String mbWrite(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			map.put("mid", session.getAttribute("mid"));
		int result = mbService.mbWrite(map); //servletKey를 배웁니다.
		System.out.println(map);
		return "mbdetail?mbno=" + map.get("mb_no");
		} else {
			return "redirect:/login.sik?error=login";
		}
	}
	
	@GetMapping("/mbdetail")
	public String mbdetail(@RequestParam(value = "mbno", required = true) int mbno, Model model) {
		System.out.println(mbno);
		Map<String, Object> detail = mbService.mbdetail(mbno);
		model.addAttribute("detail", detail);
		return "mbdetail";
	}
}
