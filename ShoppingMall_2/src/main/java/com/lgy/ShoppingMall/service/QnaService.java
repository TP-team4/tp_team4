package com.lgy.ShoppingMall.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.ShoppingMall.dto.Criteria;
import com.lgy.ShoppingMall.dto.PQnaDto;
import com.lgy.ShoppingMall.dto.PQnaReDto;

public interface QnaService {
//	아이디 없으면 return loginPage
	public ArrayList<PQnaDto> QnaLogincheck(String id);
	
//	문의 전체보기 페이징, 검색 리스트
	public int getTotalCount();
	public ArrayList<PQnaDto> QnaList(Criteria cri);
	public ArrayList<PQnaDto> QnaSearchList(Criteria cri);
	
//	문의작성
	public void PQnaWrite(HashMap<String, String> param);

//	문의이미지파일업로드

//	문의보기
	public PQnaDto PQnaContentView(HashMap<String, String> param);
	
//	문의수정
	public void PQnaModify(HashMap<String, String> param);
	
//	문의삭제
	public void PQnaDelete(HashMap<String, String> param);
	
//	문의에 단 댓글 조회
	public ArrayList<PQnaReDto> PQnaCmtList(HashMap<String, String> param);
	
//	문의 댓글 작성
	public void PQnaCmtWrite(HashMap<String, String> param);
	
//	문의 댓글 수정
	public void PQnaCmtModify(HashMap<String, String> param);
	
//	문의 댓글 삭제
	public void PQnaCmtDelete(HashMap<String, String> param);
}
