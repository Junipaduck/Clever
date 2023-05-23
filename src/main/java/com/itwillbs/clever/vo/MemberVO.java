package com.itwillbs.clever.vo;

import lombok.Data;

/*

이름 / 아이디 / 패스워드 / 패스워드 재확인 / 연락처 / 주소 / 이메일 / 생년월일 / 관심카테고리 / 포인트

CREATE TABLE member (
      member_idx INT,
      member_id VARCHAR(45),
      member_passwd VARCHAR(100),
      member_name VARCHAR(45),
      member_birth VARCHAR(45),
      member_phone VARCHAR(45),
      member_email VARCHAR(50),
      member_interest VARCHAR(45),
      member_join_date DATE,
      email_auth_status CHAR(1),
      member_point INT
      
); 

*/

@Data
public class MemberVO {
	private int member_idx;
	private String member_id;
	private String member_passwd;
	private String member_name;
	private String member_birth;
	private String member_phone;
	private String member_email;
	private String member_interest;
	private String member_join_date;
	private String email_auth_status;
	private int member_point;
}


