package com.lgy.ShoppingMall.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/* ======================================================
PQnaDto
문의게시판 정보를 나타내는 dto
  개발자   |   수정자   |    개발 및 수정 일자    |    수정 내용
  구나현       	             23-06-22           
====================================================== */ 

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Gu_PQnaDto {
	private int qnacode;//문의글번호
	private int procode;//상품번호
	private String qnatitle;//문의제목
	private String qnacont;//문의내용
	private Timestamp qnadate;//문의작성일
	private String qnaauth;//문의 작성자
}
