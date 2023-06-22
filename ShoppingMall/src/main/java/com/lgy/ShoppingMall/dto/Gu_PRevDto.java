package com.lgy.ShoppingMall.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/* ======================================================
PRevDto
리뷰게시판 정보를 나타내는 dto
  개발자   |   수정자   |    개발 및 수정 일자    |    수정 내용
  구나현       	             23-06-22		  상품번호, 아이디 추가           
====================================================== */ 

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Gu_PRevDto {
	private int revcode;//리뷰번호
	private String procode;//상품번호(상품)
	private String id;//아이디(회원)
	private String revtitle;//리뷰제목
	private String revcont;//리뷰내용
	private String revauth;//리뷰작성자
	private Timestamp revdate;//작성일
	private int revhit;//조회수
}