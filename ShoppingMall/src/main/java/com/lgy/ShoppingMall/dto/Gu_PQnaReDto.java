package com.lgy.ShoppingMall.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/* ======================================================
PQnaReDto
문의게시판 댓글 정보를 나타내는 dto
  개발자   |   수정자   |    개발 및 수정 일자    |    수정 내용
  구나현       	             23-06-22           
====================================================== */ 

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Gu_PQnaReDto {
	private int recode;//문의답댓번호
	private int qnacode;//문의글번호fk
	private String recont;//문의답변내용
	private Timestamp redate;//문의작성일
}
