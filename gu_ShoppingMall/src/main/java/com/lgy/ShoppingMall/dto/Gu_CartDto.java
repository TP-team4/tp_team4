package com.lgy.ShoppingMall.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Gu_CartDto {
//	cart 테이블
	private int cartcode;//장바구니번호pk
	private String userid;//회원아이디fk(회원)
	private int procode;//상품번호fk(상품)
	private int amount;//수량
	private int ischecked;//체크여부
	private int ispaid;//결제여부
	
//	상품(장바구니 join하기 위해)
	private String pName;//상품이름
	private int pPrice;//상품원가격
	private int pSale;//상품할인가격
	
//	DB 테이블에는 없고 cartDto
	private int saleTotal;//할인 적용한 상품한개에 대한 판매가격(ex>상품1|수량2| = nn,nnn)
	private int totalPrice;//할인 적용된 상품여러개 최종결제금액
	
//	saleTotal, totalPrice 두 변수값 변경을 원할 경우 이 메서드를 통해서만 가능함(그래서 setter메서드 추가 x)
	public void initsaleTotal() {
		this.saleTotal = (this.pPrice * (1-this.pSale));
		this.totalPrice = this.pSale*this.amount;
	}
	
	
	public void setCartcode(int cartcode) {
		this.cartcode = cartcode;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setProcode(int procode) {
		this.procode = procode;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public void setIschecked(int ischecked) {
		this.ischecked = ischecked;
	}
	public void setIspaid(int ispaid) {
		this.ispaid = ispaid;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public void setpSale(int pSale) {
		this.pSale = pSale;
	}
	
}