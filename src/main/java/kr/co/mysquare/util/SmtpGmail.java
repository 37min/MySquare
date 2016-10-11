package kr.co.mysquare.util;

import javax.mail.Authenticator;

import javax.mail.PasswordAuthentication;

public class SmtpGmail extends Authenticator {
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {

		// TODO Auto-generated method stub

		String user = "ooshoo01@gmail.com";

		String pw = "dnlsld18";

		return new PasswordAuthentication(user, pw);

	}

}
