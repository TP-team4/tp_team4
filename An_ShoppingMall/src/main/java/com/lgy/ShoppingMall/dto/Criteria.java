package com.lgy.ShoppingMall.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
public class Criteria {
	private int pageNum; //페이지 번호
	private int amount; //페이지당 글 갯수
	
	public Criteria() {
		this(1,10);
	}
	
}
