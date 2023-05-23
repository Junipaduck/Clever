package com.itwillbs.clever.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	// 회원가입 기능
	@PostMapping(value = "joinPro.me")
    public String customerJoinPro(MemberVO member, Model model, @RequestParam String member_passwd2) {
        System.out.println("memberJoinPro");
        System.out.println(member);
        
        if(member.getMember_passwd().equals(member_passwd2)) { // 비밀번호와 비밀번호 확인이 동일한지 판단
        	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        	String securePasswd = passwordEncoder.encode(member.getMember_passwd()); // 비밀번호 암호화
		System.out.println("암호문 : " + securePasswd);
        	member.setMember_passwd(securePasswd); // 암호화 비밀번호 
        	int insertCnt = memberService.insertMember(member); // 회원가입이 이루어 졌는지 정수에 저장
        	
        	if(insertCnt > 0) { // 회원가입을 성공 했을 때
        		model.addAttribute("msg", "회원 가입 성공!");
        		model.addAttribute("target","./");
        		return "member/success";
        	} else { // 회원가입을 실패 했을 때
        		model.addAttribute("msg", "회원가입 실패!");
        		return "member/fail_back";
        	}
        } else { // 비밀번호 확인과 비밀번호 가 서로 다를 때
        	model.addAttribute("msg", "비밀번호가 서로 다름!");
        	return "member/fail_back";
        }
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
	public String myPage(HttpSession session, Model model) {
		
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인 후 이용해주세요.");
			model.addAttribute("target", "loginForm.me");
			return "success";
		}
		
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

	
	// 채팅 폼 포워딩
	@GetMapping(value = "chatting")
	public String chatting(HttpSession session, Model model) {
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg","로그인 후 이용해주세요.");
			model.addAttribute("target","loginForm.me");
			return "success";
		}
		return "chatting/chatting";
	}
	

	
	
	
}
