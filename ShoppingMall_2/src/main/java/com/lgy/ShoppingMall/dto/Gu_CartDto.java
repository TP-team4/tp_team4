package com.lgy.ShoppingMall.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/* ======================================================
CartDto
장바구니 정보를 나타내는 dto
  개발자   |   수정자   |    개발 및 수정 일자    |    수정 내용
  구나현       구나현         	23-07-06           cartList join을 위해 product컬럼추가
====================================================== */ 

//@ToString
//@Getter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Gu_CartDto {
//	cart 테이블
//	private int cartcode;//장바구니번호pk => String으로 변경
	private String cartcode;//장바구니번호pk
	private String userid;//회원아이디fk(회원)
	private int procode;//상품번호fk(상품)
	private int amount;//수량
	private int ischecked;//체크여부
	private int ispaid;//결제여부
	private String color;//회원아이디fk(회원)
	private String psize;//회원아이디fk(회원)
	
//	상품(장바구니 join하기 위해)
//	private int procode;
	private int catecode;
	private String proname;
	private String proprice;
	private String prosale;
	private String proinfo;
	private String proyn;
	private int proqty;
	private String prothumb;
	private String proimg;
}