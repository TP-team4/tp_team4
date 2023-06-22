package com.lgy.ShoppingMall.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/* ======================================================
PRevCmtDto
리뷰게시판 댓글 정보를 나타내는 dto
  개발자   |   수정자   |    개발 및 수정 일자    |    수정 내용
  구나현       구나현	   		23-06-22			댓작성자, 댓글비밀번호 지움           
====================================================== */ 

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Gu_PRevCmtDto {
	private int revcode;//리뷰글번호
	private int cmtcode;//리뷰댓글번호
//	private String cmtname;//댓작성자[아이디]
//	private String cmtpwd;//댓글비밀번호[회원비밀번호? 없어도 될듯]
	private String cmtcont;//댓글내용
	private Timestamp cmtdate;//댓글 작성일
}