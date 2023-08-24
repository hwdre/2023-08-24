package com.hsw.web.Service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hsw.web.dao.BoardDAO;
import com.hsw.web.dto.BoardDTO;
import com.hsw.web.util.Util;

@Service
public class BoardService {
	
	@Autowired
	private Util util;
	
	@Autowired
	private BoardDAO boardDAO;

	public List<BoardDTO> boardList() {
		
		return boardDAO.boardList();
	}
	
	public BoardDTO detail(int bno) {
		//읽음수 + 1 합니다.
		boardDAO.readUp(bno);
		return boardDAO.detail(bno);
	}

	public int write(BoardDTO dto) {
		//ip
		dto.setBip(util.getIp());
		//uuid
		dto.setUuid(UUID.randomUUID().toString());
		return boardDAO.write(dto);
	}

	public int delete(BoardDTO dto) {
		// TODO Auto-generated method stub
		return boardDAO.delete(dto);
	}

	public BoardDTO detail2(int bno) {
		// TODO Auto-generated method stub
		return boardDAO.detail2(bno);
	}
	
}
