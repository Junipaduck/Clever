package com.itwillbs.clever.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.clever.service.*;
import com.itwillbs.clever.socket.*;
import com.itwillbs.clever.vo.*;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BankService bankService;
	
	@Value("${client_id}")
	private String client_id;
	
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
	@ResponseBody
    @GetMapping(value = "MemberCheckDupIdPro.me")
    public boolean MemberCheckDupIdPro(@RequestParam String member_id) {
    	System.out.println("MemberCheckDupIdPro");
    	System.out.println(member_id);
    	boolean isDupilcateMember = memberService.isDupilcateMember(member_id); // 일치하는 값이 있을 시 true를 응답
    	System.out.println(isDupilcateMember);
    	return isDupilcateMember;
    	
    }
	
	// 아이디 찾기 페이지 포워딩
	@GetMapping("/findId.me")
	public String findId() {
		return "member/find_id_form";
	}
	
	// 아이디 찾기 
	@PostMapping(value = "/findIdPro.me")
    public String findIdPro(MemberVO member,Model model) {
		System.out.println("정보 확인 " + member);
    	String id = memberService.findId(member);
    	String msg = "";
    	if(id != null && !id.equals("")) {
    		model.addAttribute("msg", "조회 된 아이디는 " + id + "입니다.");
    		model.addAttribute("msg2", "해당 아이디로 로그인 하시겠습니까?");
    		model.addAttribute("target", "loginForm.me?member_id=" + id);
    		return "confirm";
    	} else {
    		model.addAttribute("msg", "조회 된 아이디가 없습니다.");
    		return "fail_back";
    	}
    }
	
	// 비밀번호찾기 페이지 포워딩
	@GetMapping("/findPasswd.me")
	public String findPasswd() {
		return "member/find_passwd_form";
	}
	
	// 비밀번호 찾기 
	@PostMapping(value = "/findPasswdPro.me")
    public String findPasswdPro(MemberVO member, Model model) {
    	member = memberService.selectMemberFindPasswd(member);
    	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    	String securePasswd = passwordEncoder.encode("1234"); // 비밀번호 암호화
    	System.out.println("암호문 : " + securePasswd);
    	member.setMember_passwd(securePasswd); // 암호화 비밀번호
    	int updateCnt = memberService.updateMemberFindPasswd(member);
    	
    	if(updateCnt > 0) {
    		model.addAttribute("msg", "비밀번호가 재설정 되었습니다. 변경된 비밀번호는 1234입니다. 로그인 후 비밀번호를 꼭 변경해주세요!");
    		model.addAttribute("msg2", "로그인 하시겠습니까?");
    		model.addAttribute("target", "loginForm.me?member_id=" + member.getMember_id());
    		model.addAttribute("target2", "./");
    		return "confirm";
    	} else {
    		model.addAttribute("msg", "아이디, 전화번호, 이메일이 일치하는지 확인해주세요!");
    		return "fail_back";
    	}
    		
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
				
				// 핀테크 정보 세션 객체에 저장
				AccountVO account = bankService.getAccount(member.getMember_id());
				if(account != null) {
					session.setAttribute("access_token", account.getAccess_token());
					session.setAttribute("user_seq_no", account.getUser_seq_no());
				}
				
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

	
	

	
	
	
}
