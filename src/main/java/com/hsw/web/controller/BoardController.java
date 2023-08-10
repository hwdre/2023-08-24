package com.hsw.web.controller;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hsw.web.Service.BoardService;
import com.hsw.web.dto.BoardDTO;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@GetMapping("/board")
	public String board(Model model) {
		
		List<BoardDTO> list = boardService.boardList();
		//System.out.println("list: " + list);
		model.addAttribute("list", list);
		return "board";
	}
	
	@ResponseBody //ajax 쓰려면 이거 꼭 있어야 되요.
	@PostMapping("/detail")
	public String detail(@RequestParam("bno") int bno) {
		System.out.println(bno);
		String content = boardService.detail(bno);
		System.out.println(content);
		JSONObject json = new JSONObject();
		json.put("content", content);
		return json.toString();
	}
	
	@GetMapping("/write")
	public String write() {
		return "write";
	}
	
}
