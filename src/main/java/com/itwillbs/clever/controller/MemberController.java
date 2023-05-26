package com.itwillbs.clever.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.clever.service.MemberService;
import com.itwillbs.clever.socket.WebSocketHandler;
import com.itwillbs.clever.vo.MemberVO;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	
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
        		return "success";
        	} else { // 회원가입을 실패 했을 때
        		model.addAttribute("msg", "회원가입 실패!");
        		return "fail_back";
        	}
        } else { // 비밀번호 확인과 비밀번호 가 서로 다를 때
        	model.addAttribute("msg", "비밀번호가 서로 다름!");
        	return "fail_back";
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
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null) {
			model.addAttribute("msg", "로그인 후 이용해주세요.");
			model.addAttribute("target", "loginForm.me");
			return "success";
		}
		
		MemberVO member = memberService.selectMember(sId);
		
		model.addAttribute("member", member);
		
		return "mypage/my_page";
	}
	
	
	// 로그인 기능
	@PostMapping(value = "loginPro.me")
	public String LoginPro(MemberVO member, HttpSession session, Model model) {
		
		System.out.println("아이디 : " + member.getMember_id() + ", 패스워드 : " + member.getMember_passwd());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String passwd = memberService.getPasswd(member);
		if(encoder.matches(member.getMember_passwd(), passwd)) {
			member.setMember_passwd(passwd);
			boolean isSuccess = memberService.isSuccessMember(member);
			System.out.println(isSuccess);
			if(isSuccess) {
				//로그인 성공 시 세션 객체에 아이디 저장 
				session.setAttribute("sId", member.getMember_id());
				return "redirect:/"; // 로그인 성공 시 -> main 페이지로 리다이렉트 이동 
			} else {
				model.addAttribute("msg","로그인 실패!");
				return "fail_back";
			}	
		} else {
			model.addAttribute("msg","로그인 실패!");
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
			model.addAttribute("msg","로그인 후 이용해주세요!");
			model.addAttribute("target","loginForm.me");
			return "success";
		}
		
//		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		
//		
//		logger.info("==================================");
//		logger.info("@ChatController, GET Chat / Username : " + user.getUsername());
//		
//		model.addAttribute("userid", user.getUsername());
		
		return "chatting/chatting";
	}
	

	
	
	
}
