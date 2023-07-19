package com.lgy.ShoppingMall.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PRevDto {
	private int revcode;
	private int procode;
	private String id;
	private String revtitle;
	private String revcont;
	private Date revdate;
	private int revhit;
	
//	join
	private String proimg;// 이미지
	private String prothumb;// 이미지
	private String proname;
	private int proprice;
	
	private String cartcode;
	private int status;
	private String userid;
	public String revimg;
	
//	review comments(관리자용)
	private int cmtcode;
	private String cmtcont;
	private Date cmtdate;
	   
	private String count;
}