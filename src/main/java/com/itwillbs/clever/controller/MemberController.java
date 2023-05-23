package com.itwillbs.clever.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.clever.service.MemberService;
import com.itwillbs.clever.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// 로그인 페이지 포워딩 
	@GetMapping("/loginForm.me")
	public String loginForm() {
		return "member/login_form";
	}
	
	// 회원가입 페이지 포워딩
	@GetMapping("/joinForm.me")
	public String joinForm() {
		return "member/join_form";
	}
	
	// 아이디찾기 페이지 포워딩
	@GetMapping("/findId.me")
	public String findId() {
		return "member/find_id_form";
	}
	
	
	// 비밀번호찾기 페이지 포워딩
	@GetMapping("/findPasswd.me")
	public String findPasswd() {
		return "member/find_passwd_form";
	}
	
	// 마이페이지 포워딩
	@GetMapping("/myPage.me")
	public String myPage() {
		return "mypage/my_page";
	}
	
	
	// 로그인 기능
	@PostMapping(value = "loginPro.me")
	public String LoginPro(MemberVO member, HttpSession session, Model model) {
		
		System.out.println("아이디 : " + member.getMember_id() + ", 패스워드 : " + member.getMember_passwd());
		
			boolean loginSuccess = memberService.loginSuccess(member);
			if(loginSuccess) {
				//로그인 성공 시 세션 객체에 아이디 저장 
				session.setAttribute("sId", member.getMember_id());
				return "redirect:/"; // 로그인 성공 시 -> main 페이지로 리다이렉트 이동 
			} else {
				model.addAttribute("msg","아이디 혹은 패스워드가 일치하지 않습니다.");
				return "fail_back";
			}	
		
	}
	
	// 로그아웃 기능
	@GetMapping(value = "logout.me")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 초기화 
		return "redirect:/"; // 로그아웃 후 메인화면으로 리다이렉트 이동 
	}

	

	
	
	
}
