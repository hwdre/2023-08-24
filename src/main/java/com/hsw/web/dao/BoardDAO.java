package com.hsw.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hsw.web.dto.BoardDTO;

@Repository
@Mapper
public interface BoardDAO {
	
	List<BoardDTO> boardList();

	BoardDTO detail(int bno);

	int write(BoardDTO dto);

	void readUp(int bno);

	int delete(BoardDTO dto);

	BoardDTO detail2(int bno);

	

	
	
}
