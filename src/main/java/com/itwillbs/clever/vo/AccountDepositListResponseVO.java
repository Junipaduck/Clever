package com.itwillbs.clever.vo;

import java.util.*;

import lombok.*;

@Data
public class AccountDepositListResponseVO {
	private String api_tran_id;
	private String api_tran_dtm;
	private String rsp_code;
	private String rsp_message;
	private String wd_bank_code_std;
	private String wd_bank_code_sub;
	private String wd_bank_name;
	private String wd_account_num_masked;
	private String wd_print_content;
	private String wd_account_holder_name;
	private int res_cnt;
	private List<AccountDepositResponseVO> res_list;
}












