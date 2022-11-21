package member.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;

@WebServlet("/member/searchPw.do")
public class SearchPwController extends HttpServlet{  

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 파라미터 값 조회
		String memId = req.getParameter("memId");
		String mail = req.getParameter("mail");
		
		//서비스 객체 생성
		IMemberService memberService = MemberServiceImpl.getInstance();
		
		MemberVO memVo = new MemberVO();
		memVo.setMemId(memId);
		memVo.setMail(mail);
		
		MemberVO mv = memberService.searchPw(memVo);
		
		
		class MyAuthentication extends Authenticator {
			
			PasswordAuthentication pa;
			public MyAuthentication(){
				
				String id = "tjqlsldl@naver.com";  //네이버 이메일 아이디
				String pw = "CCJTDEPDMN22";        //네이버 비밀번호
				
				// ID와 비밀번호를 입력한다.
				pa = new PasswordAuthentication(id, pw);
			}
			
			// 시스템에서 사용하는 인증정보
			public PasswordAuthentication getPasswordAuthentication() {
				return pa;
			}
		} 
		
		
		if(mv != null) { 
			Properties p = System.getProperties();
			p.put("mail.smtp.starttls.enable", "true"); // gmail은 true 고정
			p.put("mail.smtp.host", "smtp.naver.com"); // smtp 서버 주소
			p.put("mail.smtp.auth", "true"); // gmail은 true 고정
			p.put("mail.smtp.port", "587"); // 네이버 포트
			p.put("mail.smtp.port", "587"); // 네이버 포트

			Authenticator auth = new MyAuthentication();
			// session 생성 및 MimeMessage생성
			Session session = Session.getDefaultInstance(p, auth);
			MimeMessage msg = new MimeMessage(session);

			try {
				// 편지보낸시간
				msg.setSentDate(new Date());
				InternetAddress from = new InternetAddress();
				from = new InternetAddress("tjqlsldl@naver.com"); // 발신자 아이디
				// 이메일 발신자
				msg.setFrom(from);
				// 이메일 수신자
				InternetAddress to = new InternetAddress(memVo.getMail());
				msg.setRecipient(Message.RecipientType.TO, to);
				// 이메일 제목
				msg.setSubject("[온(溫:ON]회원님의 비밀번호입니다", "UTF-8");
				// 이메일 내용
				msg.setText("비밀번호는 \"" + mv.getMemPass() + "\"입니다.", "UTF-8");
				// 이메일 헤더
				msg.setHeader("content-Type", "text/html");
				// 메일보내기
				javax.mail.Transport.send(msg, msg.getAllRecipients());

			} catch (AddressException addr_e) {
				addr_e.printStackTrace();
			} catch (MessagingException msg_e) {
				msg_e.printStackTrace();
			} catch (Exception msg_e) {
				msg_e.printStackTrace();
			}
			
			req.getSession().setAttribute("rst", "ok");	
		}else {
			req.getSession().setAttribute("rst", "no");	
		}
		req.getRequestDispatcher("/member/search_pw.jsp").forward(req, resp);		
		
		
		  
	}	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
