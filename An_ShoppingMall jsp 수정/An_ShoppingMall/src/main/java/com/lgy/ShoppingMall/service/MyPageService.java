package com.lgy.ShoppingMall.service;

import java.util.HashMap;

import com.lgy.ShoppingMall.dto.MemberDto;

public interface MyPageService {
	//로그인 정보 가져옴
	public MemberDto loginYn(HashMap<String, String> param);
	
	//조회
	public MemberDto myPageView(HashMap<String, String> param);
	
	//수정
	public void myPageModify(HashMap<String, String> param);
	
	//비밀번호
	public MemberDto memberPassword(HashMap<String, String> param);
	
	//탈퇴
	 public void memberDelete(HashMap<String, String> param);
}
