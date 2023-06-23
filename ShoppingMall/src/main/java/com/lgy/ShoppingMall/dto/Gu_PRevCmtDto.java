package com.lgy.ShoppingMall.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
//==========================================================
//Gu_PRevCmtDto.java
//
//  개발자   |   수정자   |    개발 및 수정 일자    |    수정 내용
//  구나현       박동명           23-06-23          cmtname, cmtpwd 제외
//===========================================================
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