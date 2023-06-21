package com.lgy.ShoppingMall.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Gu_PRevDto {
	private int revcode;
	private String revtitle;
	private String revcont;
	private String revauth;
	private Timestamp revdate;
	private int revhit;
}