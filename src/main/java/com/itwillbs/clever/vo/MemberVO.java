package com.itwillbs.clever.vo;

import lombok.Data;

/*

이름 / 아이디 / 패스워드 / 패스워드 재확인 / 연락처 / 주소 / 이메일 / 생년월일 / 관심카테고리 / 포인트

CREATE TABLE member (
  		member_idx INT,
  		member_name VARCHAR(20) NOT NULL,
  		member_id VARCHAR(16) UNIQUE NOT NULL,
  		member_passwd VARCHAR(16) NOT NULL,
  		member_phone VARCHAR(20) NOT NULL,
  		member_address VARCHAR(50) NOT NULL,
  		member_birth VARCHAR(20) NOT NULL,
  		member_email VARCHAR(30) UNIQUE NOT NULL,
  		member_interest VARCHAR(20) NOT NULL,
  		email_auth VARCHAR(1) NOT NULL,
  		account_auth VARCHAR(1) NOT NULL,
  		member_date DATE NOT NULL,
  		member_rank VARCHAR(10) NOT null,
  		member_point VARCHAR(20) NOT null
  		);
ALTER TABLE `member`  ADD COLUMN charge_point int; 
*/

@Data
public class MemberVO {
	private int member_idx;
	private String member_name;
	private String member_id;
	private String member_passwd;
	private String member_phone;
	private String member_address;
	private String member_address2;
	private String member_birth;
	private String member_birth2;
	private String member_email;
	private String member_email2;
	private String member_interest;
	private String email_auth;
	private String account_auth;
	private String member_date;
	private String member_rank;
	private int member_point;
	private int charge_point;
	private int member_balance;
}


