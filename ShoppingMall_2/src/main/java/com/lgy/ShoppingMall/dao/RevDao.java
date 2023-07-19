package com.lgy.ShoppingMall.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.ShoppingMall.dto.Criteria;
import com.lgy.ShoppingMall.dto.PRevCmtDto;
import com.lgy.ShoppingMall.dto.PRevDto;

public interface RevDao {
//	아이디 없으면 return loginPage
	public ArrayList<PRevDto> logincheck(String id);
//	my페이지-> 리뷰작성할 수 있는 상품 구매 목록
	public ArrayList<PRevDto> userRevWriteList(String id);
	
//	리뷰작성
	public void revWrite(HashMap<String, String> param);
	
//	리뷰 전체보기 페이징, 검색 리스트
	public int getTotalCount();
	public ArrayList<PRevDto> revListPaging(Criteria cri);
	public ArrayList<PRevDto> searchList(Criteria cri);
	
	
//	조회수 증가
	public int revUpHit(HashMap<String, String> param);
	
//	리뷰보기
	public PRevDto revContentView(HashMap<String, String> param);
	
//	리뷰수정
	public void revModify(HashMap<String, String> param);

//	리뷰삭제
	public void revDelete(HashMap<String, String> param);

//	리뷰에 단 댓글 조회
	public ArrayList<PRevCmtDto> revCmtList(HashMap<String, String> param);

//	리뷰 댓글 작성
	public void revCmtWrite(HashMap<String, String> param);
	
//	리뷰 댓글 수정
	public void revCmtModify(HashMap<String, String> param);
	
//	리뷰 댓글 삭제
	public void revCmtDelete(HashMap<String, String> param);
}
