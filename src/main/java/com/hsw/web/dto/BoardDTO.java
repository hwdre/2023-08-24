package com.hsw.web.dto;

import lombok.Data;

@Data //게터, 세터 대신 이거 씁니다. 롬복으로 쓸 수 있어
public class BoardDTO {
	
	private int bno, blike, commentcount;
	private String btitle, bcontent, m_name, m_id, bdate, bip, uuid;
}