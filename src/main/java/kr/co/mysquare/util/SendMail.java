package kr.co.mysquare.util;

import javax.mail.*;

import javax.mail.internet.InternetAddress;

import javax.mail.internet.MimeMessage;

import java.util.*;

public class SendMail {

	public static int sendMail(String id, String contents) {

		int result = 0;
		
		String from = "ooshoo01@gmail.com";

		String to = "silentbliss@naver.com";

		String notice = "";

		Properties per = new Properties();

		per.put("mail.transport", "smtp"); // 프로토콜 설정

		per.put("mail.smtp.host", "smtp.gmail.com"); // gmail SMTP 호스트 설정

		per.put("mail.smtp.port", "465"); // gmail SMTP 포트 설정

		per.put("mail.smtp.starttls.enable", "true"); // Transport Layer
														// Sercurity 설정

		per.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");

		// Secure Socket Layer(SSL)설정

		per.put("mail.smtp.user", from); // 전송자 메일주소

		per.put("mail.smtp.auth", "true"); // SMTP 인증 설정

		// SmtpGmail클래스 객체생성(gmail 아이디/비밀번호값)

		Authenticator auth = new SmtpGmail();

		Session mailSession = Session.getDefaultInstance(per, auth);

		// 메일 전송

		try {

			MimeMessage ms = new MimeMessage(mailSession);

			ms.setFrom(new InternetAddress(from));// 전송자 메일주소 설정

			ms.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(to, false));

			// 수신자 메일주소 설정

			ms.setSubject("MySquare 회원 " + id + "님이 보내신 문의 메일입니다.");

			ms.setText(contents);

			ms.setSentDate(new Date());

			Transport.send(ms);

			notice = "전송완료";
			
			result = 1;

		} catch (Exception e) {

			notice = "전송오류: " + e.toString();
			result = 0;

		}

		System.out.println(notice);
		return result;
	}

}
